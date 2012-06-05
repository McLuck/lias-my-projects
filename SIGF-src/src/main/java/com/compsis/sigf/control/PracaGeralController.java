package com.compsis.sigf.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.compsis.sigf.base.BaseTemp;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.PracaDAO;
import com.compsis.sigf.domain.BASE;
import com.compsis.sigf.domain.Praca;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 * configPracas.htm
 */
public class PracaGeralController implements Controller {

    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String cid = request.getParameter("cid");
        if(request.getParameter("cmd")!=null && request.getParameter("cmd").equals("loadtrs")){
        	ModelAndView mav = new ModelAndView("listaPracaGeral");
        	PracaDAO prdao = (PracaDAO)AFactoryDao.getInstance(PracaDAO.class);
        	List<Praca> pracas = prdao.getByConcessionaria(Integer.parseInt(cid));
        	mav.addObject("pracas", pracas);
        	return mav;
        }
    	ModelAndView mav = new ModelAndView("pracageral");
        if(cid!=null && !cid.equals("") && !cid.equals("undefined")){
            mav.addObject("cid", cid);
        }
        return mav;
    }
}
