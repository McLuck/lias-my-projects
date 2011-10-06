/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.compsis.sigf.control;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.domain.Concessionaria;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author lamancio
 */
public class AdmNavegacaoControl implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String cmd = request.getParameter("cmd");
        String cid = request.getParameter("cid");
        if (cmd == null) {
        	ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
            ModelAndView mav = new ModelAndView("main");
            mav.addObject("cid", cid);
            request.getSession().setAttribute("CurrentConc", cdao.obter(Integer.parseInt(cid)));
            return mav;
        } else if (cmd.equals("ccs")) {
            ModelAndView mav = new ModelAndView("listaConc");

            ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
            List<Concessionaria> lista = cdao.obterTodos();
            cdao.close();
            mav.addObject("ccs", lista);
            return mav;
        }
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
