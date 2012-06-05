package com.compsis.sigf.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.domain.BASE;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.ConfigAcesso;
import com.compsis.sigf.domain.ServidorBD;
import com.compsis.sigf.log.L;

/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class ConcessionariaController implements Controller {

    private ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
    private Concessionaria conc;

    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse hsr1) throws Exception {
        String cid = request.getParameter("cid");
        ModelAndView mav = new ModelAndView("concessionaria");
        String cmd = request.getParameter("cmd");
        if (cid != null) {
            conc = cdao.obter(Integer.parseInt(cid));
            if (cmd != null && cmd.equals("clone")) {
                Concessionaria clone = (Concessionaria) conc.replicate(null);
                String nome = request.getParameter("nome");
                if(nome==null){
                    nome = "(CLONE)"+conc.getNome();
                }
                clone.setNome(nome);
                cdao.clear();
                cdao.close();
                Object o = cdao.salvar(clone);
                cdao.commit();
                if (o instanceof Concessionaria) {
                    clone = (Concessionaria) o;
                } else if (o instanceof Integer) {
                    cdao.clear();
                    cdao.close();
                    clone = cdao.obter((Integer) o);
                }
                L.d("ConcessionariaController", "Listando concessionarias cadastradas. Retornando para: selecionaConcessionaria.jsp");
            	ModelAndView mav2 = new ModelAndView("selecionaConcessionaria");
            	List<Concessionaria> concs = ConcessionariaDAO.getInstance().obterTodos();
            	mav2.addObject("concs", concs);
            	return mav2;
            }else if(cmd.equals("loadConfigAcesso")){
                ConfigAcesso ca = conc.getConfiguracaAcesso();
                if(ca == null){
                    ca = new ConfigAcesso();
                }
                ModelAndView mav2 = new ModelAndView("frames/configAcesso");
                mav2.addObject("ca", ca);
                mav2.addObject("cid", cid);
                return mav2;
            }else if(cmd.equals("saveConfigAcesso")){
                ConfigAcesso cfg = new ConfigAcesso();
                cfg.setComplexidade(Integer.parseInt((String)request.getParameter("complexidade")));
                cfg.setQtdMinimaSegura(Integer.parseInt((String)request.getParameter("qtdMinimaSegura")));
                cfg.setSenhaValidade(Integer.parseInt((String)request.getParameter("senhaValidade")));
                cfg.setQtdRegistroSenha(Integer.parseInt((String)request.getParameter("qtdRegistroSenha")));
                cfg.setTempoBloqueio(Integer.parseInt(request.getParameter("tempo")));
                cfg.setToleranciaBloqueio(Integer.parseInt((String)request.getParameter("toleranciaBloqueio")));
                cfg.setSenhaExpira(request.getParameter("senhaExpira")!=null);
                cfg.setDiaSenhaExpirar(Integer.parseInt((String)request.getParameter("diaSenhaExpirar")));
                cfg.setStatusOperadorInativo(Integer.parseInt((String)request.getParameter("statusOperadorInativo")));
                cfg.setId(Integer.parseInt((String)request.getParameter("id")));
                cfg.setConcessionaria(conc);
                conc.setConfiguracaAcesso(cfg);
                cdao.salvar(conc);
                cdao.commit();
                L.d("ConcessionariaController", "Retornando para: frames/success.jsp");
                ModelAndView mav2 = new ModelAndView("frames/success");
                return mav2;
            }else if(cmd.equals("loadConcessionaria")){
            	Concessionaria conc = ConcessionariaDAO.getInstance().obter(Integer.parseInt(cid));
            	ModelAndView mav2 = new ModelAndView("index");
                mav2.addObject("conc", conc);
                mav2.addObject("cid", cid);
                return mav2;
            }
            mav.addObject("cid", cid);
            mav.addObject("pracas", conc.getPracas());
            if (conc.getServidorBD() == null) {
                conc.setServidorBD(new ServidorBD());
            }
            mav.addObject("sgbd", conc.getServidorBD());
        }else if(cmd.equals("listaConcessionaria")){
        	L.d("ConcessionariaController", "Listando concessionarias cadastradas. Retornando para: selecionaConcessionaria.jsp");
        	ModelAndView mav2 = new ModelAndView("selecionaConcessionaria");
        	List<Concessionaria> concs = ConcessionariaDAO.getInstance().obterTodos();
        	mav2.addObject("concs", concs);
        	return mav2;
        }
        mav.addObject("categorias", BASE.LISTAS.CATEGORIAS);
        mav.addObject("tiposCat", BASE.LISTAS.TIPOS_CATEGORIA);

        return mav;
    }
}
