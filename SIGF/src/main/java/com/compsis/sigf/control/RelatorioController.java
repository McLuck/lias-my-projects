package com.compsis.sigf.control;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.dao.FuncionalidadeDAO;
import com.compsis.sigf.dao.RelatorioConcessionariaDAO;
import com.compsis.sigf.dao.RelatorioDAO;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.FuncionalidadeConcessionaria;
import com.compsis.sigf.domain.Relatorio;
import com.compsis.sigf.domain.RelatorioConcessionaria;
import com.compsis.sigf.domain.relatorio.RelatorioMerge;
import com.compsis.sigf.domain.relatorio.RelatorioView;
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
public class RelatorioController implements Controller {

    private List<Relatorio> relatoriosDisponiveis;
    private List<RelatorioConcessionaria> relatoriosUtilizados;
    private List<RelatorioView> relatoriosView;
    private RelatorioDAO rdao = (RelatorioDAO) AFactoryDao.getInstance(RelatorioDAO.class);
    private RelatorioConcessionariaDAO rcdao = (RelatorioConcessionariaDAO) AFactoryDao.getInstance(RelatorioConcessionariaDAO.class);
    private Concessionaria conc;
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String cid = request.getParameter("cid");
        String cmd = request.getParameter("cmd");
        carregarRelatorios();
        if (cmd != null && !cmd.isEmpty() && !cmd.equals("undefined")) {
            if (cid != null && !cid.isEmpty() && !cid.equals("undefined")) {
                if (cmd.equals("load")) {
                    carregarRelatoriosUtlizados(Integer.parseInt(cid));
                    mergeRelatorios();
                    ModelAndView mav = new ModelAndView("listaRelatorio");
                    mav.addObject("cid", cid);
                    mav.addObject("lista", relatoriosView);
                    rcdao.close();
                    rdao.close();
                    return mav;
                } else if (cmd.equals("save")) {
                    try{
                        tratarRelatoriosView(request);
                        ModelAndView mav = new ModelAndView("frames/success");
                        return mav;
                    }catch(Exception e){
                        e.printStackTrace();
                        ModelAndView mav = new ModelAndView("frames/error");
                        mav.addObject("msg", "Erro ao processar sua solicitacao. Detalhes: "+e);
                        return mav;
                    }
                } else if(cmd.equals("clicksave")){
                	String id = request.getParameter("id");
                	ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
                    conc = cdao.obter(Integer.parseInt(cid));
                    RelatorioConcessionaria rc = rcdao.getByRelatorio(conc.getId(), Integer.parseInt(id));
                    
                    if(rc!=null){
                        //fcdao.Deletar(fc);
                        conc.getRelatorios().remove(rc);
                        cdao.salvar(conc);
                        cdao.commit();
                        cdao.clear();
                        cdao.close();
                        rcdao.close();
                        rcdao.clear();
                    }else{
                        rc = new RelatorioConcessionaria();
                        rc.setConcessionaria(conc);
                        rc.setRelatorio((((RelatorioDAO) AFactoryDao.getInstance(RelatorioDAO.class)).obter(Integer.parseInt(id))));
                        rcdao.salvar(rc);
                        rcdao.commit();
                        rcdao.close();
                        rcdao.clear();
                        rdao.clear();
                        rdao.close();
                    }
                    ModelAndView mav = new ModelAndView("frames/success");
                    mav.addObject("cid", cid);
                    return mav;
                }
            }
        }
        throw new UnsupportedOperationException("Not supported yet.");
    }

    private void carregarRelatorios() {
        relatoriosDisponiveis = rdao.obterTodos();
        rdao.close();
    }

    private void carregarRelatoriosUtlizados(int concessionariaId) {
        relatoriosUtilizados = rcdao.getByConcessionaria(concessionariaId);
    }

    private void mergeRelatorios() {
        RelatorioMerge merge = new RelatorioMerge(relatoriosDisponiveis, relatoriosUtilizados);
        relatoriosView = merge.merge();
    }
    private void tratarRelatoriosView(HttpServletRequest request){
        String name = "utilizado";
        if(relatoriosDisponiveis == null || relatoriosDisponiveis.isEmpty()){
            relatoriosDisponiveis = rdao.obterTodos();
            rdao.close();
        }
        if(conc == null){
            ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
            conc = cdao.obter(Integer.parseInt(request.getParameter("cid")));
            cdao.close();
        }
        relatoriosUtilizados = new ArrayList<RelatorioConcessionaria>();
        for(Relatorio r : relatoriosDisponiveis){
            if(request.getParameter(name+r.getId())!=null){
                RelatorioConcessionaria rc = new RelatorioConcessionaria();
                rc.setRelatorio(r);
                rc.setConcessionaria(conc);
                relatoriosUtilizados.add(rc);
            }
        }
        rcdao.SalvarTudo(relatoriosUtilizados, conc.getId());
        rcdao.commit();
        rcdao.close();
    }
}
