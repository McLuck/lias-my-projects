package com.compsis.sigf.control;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.DomainObject;

public class AbstractSimpleForm   extends SimpleFormController{
	public static final String KEY_SESSION_CONCESSIONARIA = "KEY_SESSION_CONCESSIONARIA";
	
	protected Concessionaria getConcessonaria(HttpServletRequest request, Integer cid){
		Concessionaria conc = null;
		if(request!=null){
			conc = (Concessionaria)request.getSession().getAttribute(KEY_SESSION_CONCESSIONARIA);
			if(conc!=null && conc.getId()!=null){
				if(conc.getId().equals(cid)){
					request.setAttribute(KEY_SESSION_CONCESSIONARIA, conc);
					return conc;	
				}else{
					conc = ConcessionariaDAO.getInstance().obter(cid);
					if(conc!=null){
						setConcessionaria(request, conc);
						return conc;
					}
				}
			}else if(cid!=null && cid!=null){
				conc = ConcessionariaDAO.getInstance().obter(cid);
				if(conc!=null){
					setConcessionaria(request, conc);
					return conc;
				}
			}
		}
		
		return conc;
	}
	
	protected void setConcessionaria(HttpServletRequest request, Concessionaria conc){
		if(conc!=null){
			if(request!=null){
				request.getSession().setAttribute(KEY_SESSION_CONCESSIONARIA, conc);
				request.setAttribute(KEY_SESSION_CONCESSIONARIA, conc);
			}
		}
	}
	
	protected class RequestParameters<T extends DomainObject> {
		private final Logger log = Logger.getLogger(RequestParameters.class);
		private T domain;
		private String prepend;
		HttpServletRequest request;
		public RequestParameters(HttpServletRequest request){
			this.request = request;
			this.prepend = "";
		}

		public RequestParameters(HttpServletRequest request, String prepend){
			this.request = request;
			this.prepend = prepend;
		}
		
		public T getDomain() {
			Field[] fields = domain.getClass().getDeclaredFields();
			for(Field f : fields){
				f.setAccessible(true);
				String obj = request.getParameter(prepend.concat(f.getName()));
				try{
					f.set(domain, f.getType().cast(obj));	
				}catch(Exception e){
					log.debug("Erro ao injetar dependencia em objeto da classe: ".concat(domain.getClass().getName()).concat(" para o atributo ".concat(f.getName())), e);
				}
			}
			return domain;
		}
	}
	
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map<Object, Object> dataMap = new HashMap<Object, Object>();
		String cid = request.getParameter("cid");
		if(cid!=null && !cid.equals("undefined") && !cid.isEmpty()){
			dataMap.put("cid", cid);
			Concessionaria conc = getConcessonaria(request, Integer.parseInt(cid));
			dataMap.put("conc", conc);
			dataMap.put("pracas",conc.getPracas());
			dataMap.put("cfgArrec",conc.getConfigArrecadacao());
			dataMap.put("cfgImg",conc.getConfigImagem());
			dataMap.put("cfgMalote",conc.getConfigMalote());
			dataMap.put("cfgAcesso",conc.getConfiguracaAcesso());
		}
		return dataMap;
	}
	
	/*@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse hsr1) throws Exception {
		String page = request.getParameter("page");
		String cid = request.getParameter("cid");
		ModelAndView mav = null;
		if(page!=null){
			mav = new ModelAndView(page);
			if(cid!=null && !cid.isEmpty() && !cid.equals("undefined") && getConcessonaria(request, Integer.parseInt(cid))!=null){
				Concessionaria conc = getConcessonaria(request, Integer.parseInt(cid));
				mav.addObject("cid", cid);
				mav.addObject("conc", conc);
				mav.addObject("pracas",conc.getPracas());
				mav.addObject("cfgArrec",conc.getConfigArrecadacao());
				mav.addObject("cfgImg",conc.getConfigImagem());
				mav.addObject("cfgMalote",conc.getConfigMalote());
				mav.addObject("cfgAcesso",conc.getConfiguracaAcesso());
			}
		}
		return mav;
	}*/
}
