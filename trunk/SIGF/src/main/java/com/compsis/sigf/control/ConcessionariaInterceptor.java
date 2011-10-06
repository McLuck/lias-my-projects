package com.compsis.sigf.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ConcessionariaInterceptor extends HandlerInterceptorAdapter {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String cid = request.getParameter("cid");
		if(cid!=null){
			request.setAttribute("cid", cid);
			request.getSession().setAttribute("cid", cid);
			return true;
		}else{
			cid = (String)request.getSession().getAttribute("cid");
			if(cid!=null){
				request.getSession().setAttribute("cid", cid);
				return true;
			}
		}
		if(request.getParameter("cmd")!=null && request.getParameter("cmd").equals("ccs")){
			return true;
		}
		//carrega lista cliente
		response.sendRedirect("admNavegacao.htm?cmd=ccs");
		return false;
    }
}
