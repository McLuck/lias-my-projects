/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.compsis.sigf.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author Lucas Israel
 */
public class NavegacaoOperacionalController implements Controller{

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse hsr1) throws Exception {
        String cmd = request.getParameter("cmd");
        String cid = request.getParameter("cid");
        if(cmd==null){
            ModelAndView mav = new ModelAndView("main_operacional");
            if(cid!=null && !cid.equals("") && !cid.equals("undefined")){
                mav.addObject("cid", cid);
            }
            return mav;
        }
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
