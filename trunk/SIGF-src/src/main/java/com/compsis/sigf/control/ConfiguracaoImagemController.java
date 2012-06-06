package com.compsis.sigf.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;

import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.ConfiguracaoImagem;

public class ConfiguracaoImagemController  extends AbstractSimpleForm{
	private static final Logger log = Logger.getLogger(ConfiguracaoImagemController.class); 
	private ConfiguracaoImagem cfgImg;
	
	private ConfiguracaoImagem getDomain(HttpServletRequest request){
		return new RequestParameters<ConfiguracaoImagem>(request).getDomain();
	}
	
	
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.debug("Iniciando handleRequest");
		String cid = request.getParameter("cid");
		ModelAndView mav = super.handleRequest(request, response);
		cfgImg = getDomain(request);
		if(cfgImg!=null){
			if(cfgImg.getConcessionaria()==null && cid!=null){
				Concessionaria conc = getConcessonaria(request, Integer.parseInt(cid));
				cfgImg.setConcessionaria(conc);
				conc.setConfigImagem(cfgImg);
				ConcessionariaDAO.getInstance().atualizar(conc);
				ConcessionariaDAO.getInstance().commit();
			}
		}
		return mav;
	}
}
