package com.compsis.sigf.control;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.compsis.sigf.base.BaseTemp;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.PistaDAO;
import com.compsis.sigf.dao.PracaDAO;
import com.compsis.sigf.domain.BASE;
import com.compsis.sigf.domain.Pista;
import com.compsis.sigf.domain.Praca;

import java.util.ArrayList;
import java.util.List;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class ListaPistaController implements Controller  {
    private String pracaid;
    private String siglaS1, siglaS2, descricaoS1, descricaoS2, reversivel;
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        pracaid = request.getParameter("pracaid");
        String cmd = request.getParameter("cmd");
        if(cmd!=null){
            if(cmd.equals("delete")){
                String idp = request.getParameter("idp");
                if(idp!=null && pracaid!=null && !idp.equals("_new")){
                    PistaDAO pdao = (PistaDAO) AFactoryDao.getInstance(PistaDAO.class);
                    Pista pst = pdao.obter(Integer.parseInt(idp));//(Pista)BaseTemp.GET(Integer.parseInt(idp), Pista.class,null);
                    pdao.close();
                    pdao.Deletar(pst);
                    
                    ModelAndView mav = new ModelAndView("frames/success");
                    return mav;
                }
            }
        }
        if (pracaid == null) {
            return null;
        }
        ModelAndView mav = new ModelAndView("frames/pistasPracasLista");
        mav.addObject("tipospista", BASE.LISTAS.TIPOS_PISTAS);
        mav.addObject("pracaid", pracaid);
        PracaDAO pdao = (PracaDAO) AFactoryDao.getInstance(PracaDAO.class);
        
        Praca p = pdao.obter(Integer.parseInt(pracaid));
        
        List<Pista> pistas = p.getPistas();
        mav.addObject("pistas", pistas);
        mav.addObject("siglaS1", p.getSiglaSentido1());
        mav.addObject("siglaS2", p.getSiglaSentido2());
        mav.addObject("descS1", p.getSentido1());
        mav.addObject("descS2", p.getSentido2());
        mav.addObject("siglaS3", p.getSigla3());
        return mav;
    }

    /**
     * @return the pracaid
     */
    public String getPracaid() {
        return pracaid;
    }

    /**
     * @param pracaid the pracaid to set
     */
    public void setPracaid(String pracaid) {
        this.pracaid = pracaid;
    }

    /**
     * @return the siglaS2
     */
    public String getSiglaS2() {
        return siglaS2;
    }

    /**
     * @param siglaS2 the siglaS2 to set
     */
    public void setSiglaS2(String siglaS2) {
        this.siglaS2 = siglaS2;
    }

    /**
     * @return the siglaS1
     */
    public String getSiglaS1() {
        return siglaS1;
    }

    /**
     * @param siglaS1 the siglaS1 to set
     */
    public void setSiglaS1(String siglaS1) {
        this.siglaS1 = siglaS1;
    }

    /**
     * @return the descricaoS1
     */
    public String getDescricaoS1() {
        return descricaoS1;
    }

    /**
     * @param descricaoS1 the descricaoS1 to set
     */
    public void setDescricaoS1(String descricaoS1) {
        this.descricaoS1 = descricaoS1;
    }

    /**
     * @return the descricaoS2
     */
    public String getDescricaoS2() {
        return descricaoS2;
    }

    /**
     * @param descricaoS2 the descricaoS2 to set
     */
    public void setDescricaoS2(String descricaoS2) {
        this.descricaoS2 = descricaoS2;
    }

    /**
     * @return the reversivel
     */
    public String getReversivel() {
        return reversivel;
    }

    /**
     * @param reversivel the reversivel to set
     */
    public void setReversivel(String reversivel) {
        this.reversivel = reversivel;
    }

}
