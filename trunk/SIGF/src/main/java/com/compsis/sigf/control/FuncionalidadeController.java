package com.compsis.sigf.control;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.dao.FuncionalidadeConcessionariaDAO;
import com.compsis.sigf.dao.FuncionalidadeDAO;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Funcionalidade;
import com.compsis.sigf.domain.FuncionalidadeConcessionaria;
import com.compsis.sigf.domain.funcionalidade.FuncionalidadeMerge;
import com.compsis.sigf.domain.funcionalidade.FuncionalidadeView;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author Lucas Israel
 */
public class FuncionalidadeController implements Controller {

    private List<Funcionalidade> funcionalidadesDisponiveis;
    private List<FuncionalidadeConcessionaria> funcionalidadesUtilizados;
    private List<FuncionalidadeView> funcionalidadeView;
    private FuncionalidadeDAO rdao = (FuncionalidadeDAO) AFactoryDao.getInstance(FuncionalidadeDAO.class);
    private FuncionalidadeConcessionariaDAO fcdao = (FuncionalidadeConcessionariaDAO) AFactoryDao.getInstance(FuncionalidadeConcessionariaDAO.class);
    private Concessionaria conc;
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String cid = request.getParameter("cid");
        String cmd = request.getParameter("cmd");
        carregarFuncionalidades();
        if (cmd != null && !cmd.isEmpty() && !cmd.equals("undefined")) {
            if (cid != null && !cid.isEmpty() && !cid.equals("undefined")) {
                if (cmd.equals("load")) {
                    carregarFuncionalidadesUtlizados(Integer.parseInt(cid));
                    mergeFuncionalidades();
                    ModelAndView mav = new ModelAndView("listaFuncionalidade");
                    mav.addObject("cid", cid);
                    mav.addObject("lista", funcionalidadeView);
                    fcdao.close();
                    rdao.close();
                    return mav;
                } else if (cmd.equals("save")) {
                    try{
                        tratarFuncionalidadesView(request);
                        ModelAndView mav = new ModelAndView("frames/success");
                        mav.addObject("cid", cid);
                        return mav;
                    }catch(Exception e){
                        e.printStackTrace();
                        ModelAndView mav = new ModelAndView("frames/error");
                        mav.addObject("msg", "Erro ao processar sua solicitacao. Detalhes: "+e);
                        mav.addObject("cid", cid);
                        return mav;
                    }
                }else if (cmd.equals("clicksave")) {
                    try{
                        ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
                        conc = cdao.obter(Integer.parseInt(cid));
                        String idf = request.getParameter("id");
                        FuncionalidadeConcessionaria fc = fcdao.getByFuncionalidade(conc, Integer.parseInt(idf));
                        if(fc!=null){
                            //fcdao.Deletar(fc);
                            conc.getFuncionalidades().remove(fc);
                            cdao.salvar(conc);
                            cdao.commit();
                            cdao.clear();
                            cdao.close();
                            fcdao.close();
                            fcdao.clear();
                        }else{
                            fc = new FuncionalidadeConcessionaria();
                            fc.setConcessionaria(conc);
                            fc.setFuncionalidade(((FuncionalidadeDAO) AFactoryDao.getInstance(FuncionalidadeDAO.class)).obter(Integer.parseInt(idf)));
                            fcdao.salvar(fc);
                            fcdao.commit();
                            fcdao.close();
                            fcdao.clear();
                            cdao.clear();
                            cdao.close();
                        }
                        ModelAndView mav = new ModelAndView("frames/success");
                        mav.addObject("cid", cid);
                        return mav;
                    } catch(Exception e) {
                        e.printStackTrace();
                        ModelAndView mav = new ModelAndView("frames/error");
                        mav.addObject("msg", "erro ao efetuar operacao");
                        mav.addObject("cid", cid);
                        return mav;
                    }
                }
            }
        }
        throw new UnsupportedOperationException("Not supported yet.");
    }

    private void carregarFuncionalidades() {
        funcionalidadesDisponiveis = rdao.obterTodos();
        rdao.close();
    }

    private void carregarFuncionalidadesUtlizados(int concessionariaId) {
        funcionalidadesUtilizados = fcdao.getByConcessionaria(concessionariaId);
    }

    private void mergeFuncionalidades() {
        FuncionalidadeMerge merge = new FuncionalidadeMerge(funcionalidadesDisponiveis, funcionalidadesUtilizados);
        funcionalidadeView = merge.merge();
    }
    private void tratarFuncionalidadesView(HttpServletRequest request){
        String name = "utilizado";
        if(funcionalidadesDisponiveis == null || funcionalidadesDisponiveis.isEmpty()){
            funcionalidadesDisponiveis = rdao.obterTodos();
            rdao.close();
        }
        if(conc == null){
            ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
            conc = cdao.obter(Integer.parseInt(request.getParameter("cid")));
            cdao.close();
        }
        funcionalidadesUtilizados = new ArrayList<FuncionalidadeConcessionaria>();
        for(Funcionalidade r : funcionalidadesDisponiveis){
            if(request.getParameter(name+r.getId())!=null){
                FuncionalidadeConcessionaria rc = new FuncionalidadeConcessionaria();
                rc.setFuncionalidade(r);
                rc.setConcessionaria(conc);
                funcionalidadesUtilizados.add(rc);
            }
        }
        fcdao.SalvarTudo(funcionalidadesUtilizados, conc.getId());
        fcdao.commit();
        fcdao.close();
    }
}
