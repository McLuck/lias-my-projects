package com.compsis.sigf.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.domain.BASE;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.ConfigAcesso;
import com.compsis.sigf.domain.ServidorBD;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

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
        if (cid != null) {
            conc = cdao.obter(Integer.parseInt(cid));

            String cmd = request.getParameter("cmd");
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
                ModelAndView mav2 = new ModelAndView("frames/success");
                mav2.addObject("clone", clone);
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
                ModelAndView mav2 = new ModelAndView("frames/success");
                return mav2;
            }
            mav.addObject("cid", cid);
            mav.addObject("pracas", conc.getPracas());
            if (conc.getServidorBD() == null) {
                conc.setServidorBD(new ServidorBD());
            }
            mav.addObject("sgbd", conc.getServidorBD());
        }
        mav.addObject("categorias", BASE.LISTAS.CATEGORIAS);
        mav.addObject("tiposCat", BASE.LISTAS.TIPOS_CATEGORIA);

        return mav;
    }
}
