/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.compsis.sigf.control;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.dao.TabelaDAO;
import com.compsis.sigf.dao.VersaoDAO;
import com.compsis.sigf.domain.Campo;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Insert;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.domain.Versao;
import com.compsis.sigf.log.L;
import com.compsis.sigf.regras.command.sql.ClearSql;
import com.compsis.sigf.regras.command.sql.OrigemCommand;
import com.compsis.sigf.regras.command.sql.RelatorioCommand;
import com.compsis.sigf.script.manager.ManagementScript;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author Lucas Israel
 */
public class ScriptController implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //ModelAndView mav = new ModelAndView("frames/script");
        String cmd = request.getParameter("cmd");

        String scriptAdd = "commit";
        //Carrega inserts, caso exista
        List<Insert> listInserts = (ArrayList<Insert>) request.getSession().getAttribute("inserts");
        List<Tabela> listTabelas = new ArrayList<Tabela>();
        if (cmd != null && !cmd.isEmpty()) {
            if (listInserts != null && !listInserts.isEmpty()) {
                for (Insert ii : listInserts) {
                    if (ii != null) {
                        Tabela t = ii.getTbAux();
                        for (Campo cp : t.getCampos()) {
                            cp.setValor((String) request.getParameter(cp.getNome() + ii.getId()));
                        }
                        listTabelas.add(t);
                    }
                }
            }
        }
        String cid = request.getParameter("cid");
        String vid = request.getParameter("vid");
        String down = request.getParameter("down");
        boolean download = down!=null&&down.toLowerCase().trim().equals("true");
        if (cid != null && !cid.equals("") && !cid.equals("undefined")
                && vid != null && !vid.equals("") && !vid.equals("undefined")) {


            VersaoDAO vdao = (VersaoDAO) AFactoryDao.getInstance(VersaoDAO.class);
            Versao versao = vdao.obter(Integer.parseInt(vid));
            if (listInserts == null) {
                boolean existInsertsAdicionais = false;
                List<Insert> listIns = new ArrayList<Insert>();
                if (versao.getInserts() != null && !versao.getInserts().isEmpty()) {
                    for (Insert ii : versao.getInserts()) {
                        if (ii != null) {
                            existInsertsAdicionais = true;
                            listIns.add(ii);
                        }
                    }
                }

                if (existInsertsAdicionais) {
                    TabelaDAO tdao = (TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);
                    for (Insert ii : listIns) {
                        List<Tabela> aux = tdao.getByVersaoAndNome(ii.getVersao().getId(), ii.getTabela());
                        if (aux != null && !aux.isEmpty()) {
                            for (Tabela tla : aux) {
                                if (tla != null) {
                                    List<Campo> listaCampo = new ArrayList<Campo>();
                                    for (Campo cp : tla.getCampos()) {
                                        if (cp != null) {
                                            listaCampo.add(cp);
                                        }
                                    }
                                    tla.setCampos(listaCampo);
                                    ii.setTbAux(tla);
                                    break;
                                }
                            }
                        }
                    }
                    //tdao.clear();
                    //tdao.close();
                    request.getSession().setAttribute("inserts", listIns);

                    ModelAndView mav = new ModelAndView("insertsAdicionais");
                    mav.addObject("inserts", listIns);
                    mav.addObject("cid", cid);
                    vdao.close();
                    return mav;
                }

            } else {
                scriptAdd = ManagementScript.getInstance().export(listTabelas);
                request.getSession().removeAttribute("inserts");
            }
            
            long inicio = Calendar.getInstance().getTimeInMillis();
            L.d(this.getClass().getName() , "Iniciando carregamento de dados para Scripts...");
            ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
            Concessionaria conc = cdao.obter(Integer.parseInt(cid));
            L.d(this.getClass().getName() , "Dados carregados!");

            TabelaDAO dao = (TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);
            List<Tabela> list = dao.getByVersaoAndNome(versao.getId(), "origem");
            Tabela t = list.get(0);
            
            L.d(this.getClass().getName() , "Iniciando processamento de dados da Origem e dependentes da Origem.");
            OrigemCommand orgCommand = new OrigemCommand(t, conc);
            orgCommand.execute();
            String script = String.valueOf(orgCommand.getPropertyValue());           
            L.d(this.getClass().getName() , "Origem processada com sucesso!");
            
            L.d(this.getClass().getName() , "Iniciando processamento de dados dos Relatorios e dependencias");
            RelatorioCommand relC = new RelatorioCommand(Integer.parseInt(vid), conc.getId());
            relC.execute();
            script = script.concat(String.valueOf(relC.getPropertyValue()));
            L.d(this.getClass().getName() , "Relatorios processados com sucesso!");
            
            //Limpar script
            L.d(this.getClass().getName() , "Iniciando processamento de limpeza dos scripts gerados");
            ClearSql clear = new ClearSql(null, conc, script);
            clear.execute();
            script = (String)clear.getPropertyValue();
            L.d(this.getClass().getName() , "Limpeza dos scripts efetuada com sucesso!");
            
            //Fechar conexoes
            AFactoryDao.CLOSE_ALL_CONNECTIONS();
            //cdao.close();
            //cdao.clear();
            
            long fim = Calendar.getInstance().getTimeInMillis();
            L.d(this.getClass().getName() , "Scripts processados. Tempo total: "+((fim-inicio)/1000)+" seg(s)");
            
            AFactoryDao.CLEAR_ALL();
            request.getSession().setAttribute("script", script);
            request.getSession().setAttribute("cid", cid);
            if(!download){
            	//Gera Script
                ModelAndView mav = new ModelAndView("frames/script");
                mav.addObject("script", script);
                mav.addObject("cid", cid);
                return mav;	
            }else{
            	//Gera Script
                ModelAndView mav = new ModelAndView("frames/success");
            	//ModelAndView mav = new ModelAndView("Status?cmd=download");
                return mav;
            }
        } else {
            ModelAndView mav = new ModelAndView("frames/script");
            mav.addObject("script", "Nenhuma concessionaria iniciada para gerar script no momento.");
            return mav;
        }
    }
}
