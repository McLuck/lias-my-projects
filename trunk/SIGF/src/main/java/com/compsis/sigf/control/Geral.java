
package com.compsis.sigf.control;
import com.compsis.sigf.base.BaseTemp;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.domain.Arrecadacao;
import com.compsis.sigf.domain.BASE.TIPOS;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.ConfiguracaoImagem;
import com.compsis.sigf.domain.Localizacao;
import com.compsis.sigf.domain.Malote;
import com.compsis.sigf.domain.Pista;
import com.compsis.sigf.domain.Praca;
import com.compsis.sigf.domain.ServidorBD;

import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.bind.ServletRequestDataBinder;

/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class Geral extends SimpleFormController implements Controller {
    private Concessionaria conc;
    public static final String CONC_SESSAO = "CurrentConcessionariaSession";
    private ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
    
    public static synchronized boolean temAVI(Concessionaria concessionaria){
		if(concessionaria!=null){
			if(concessionaria.getPracas()!=null && !concessionaria.getPracas().isEmpty()){
				for(Praca pr : concessionaria.getPracas()){
					if(pr!=null){
						if(pr.getLocalizacoes()!=null && !pr.getLocalizacoes().isEmpty()){
							for(Localizacao lc : pr.getLocalizacoes()){
								if(lc!=null){
									if(lc.getPistas()!=null){
										for(Pista ps : lc.getPistas()){
											if(ps!=null){
												if(ps.getTipo() == TIPOS.TIPO_PISTA_AUTOMATICA){
													return true;
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
    	return false;
    }
    
    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String cmd = (String)request.getParameter("cmd");
        String cid = request.getParameter("cid");
        //Concessionaria ccs;// = (Concessionaria)BaseTemp.GET(conc.getId(), Concessionaria.class, null);
        if(cid != null){
            //ccs = (Concessionaria)BaseTemp.GET(Integer.parseInt(cid), Concessionaria.class, null);
            //conc = cdao.obter(Integer.parseInt(cid));
        	conc = (Concessionaria)request.getSession().getAttribute(CONC_SESSAO);
        	if(conc==null){
        		conc = cdao.obter(Integer.parseInt(cid));
        		request.setAttribute(CONC_SESSAO, conc);
        	}
        }else{
            //ccs = new Concessionaria();
            //ccs.setPracas(new ArrayList<Praca>());
            //ccs.setServidorBD(new ServidorBD());
            conc = new Concessionaria();
            conc.setServidorBD(new ServidorBD());
            conc.setPracas(new ArrayList<Praca>());
            conc.setConfigArrecadacao(new Arrecadacao());
            conc.setConfigImagem(new ConfiguracaoImagem());
            conc.setConfigMalote(new Malote());
        }
        String url = "";
        if(cmd!=null){
            if(cmd.equals("getPracasSession")){
                url = "pracas";
                ModelAndView mav = new ModelAndView(url);
                mav.addObject("pracas",conc.getPracas());
                return mav;
            }else if(cmd.equals("removePista")){
                String id = request.getParameter("id");
                Pista pista = (Pista)BaseTemp.GET(Integer.parseInt(id), Pista.class, null);
                BaseTemp.REMOVE(pista);
                conc = cdao.obter(Integer.parseInt(cid));
        		request.setAttribute(CONC_SESSAO, conc);
                url = "pracas";
                ModelAndView mav = new ModelAndView(url);
                mav.addObject("pracas",conc.getPracas());
                return mav;
            }else if(cmd.equals("removePraca")){
                String prid = request.getParameter("pracaid");
                Praca p = (Praca)BaseTemp.GET(Integer.parseInt(prid), Praca.class, null);
                BaseTemp.REMOVE(p);
                conc = cdao.obter(Integer.parseInt(cid));
        		request.setAttribute(CONC_SESSAO, conc);
                url = "pracas";
                ModelAndView mav = new ModelAndView(url);
                mav.addObject("pracas",conc.getPracas());
                return mav;
            }else if(cmd.equals("pracaTabMenu")){
                ModelAndView mav = new ModelAndView("pracaTabConfig");
                mav.addObject("pracas", conc.getPracas());
                return mav;
            }else if(cmd.equals("getPracas")){
                //ModelAndView mav = new ModelAndView("selecionaPraca");
                ModelAndView mav = new ModelAndView("window_praca");
                mav.addObject("pracas", conc.getPracas());
                mav.addObject("cid", cid);
                return mav;
            }else if(cmd.equals("configGeral")){
                ModelAndView mav = new ModelAndView("config_geral");
                mav.addObject("cid", cid);
                mav.addObject("conc", conc);
                return mav;
            }else if(cmd.equals("saveDivida")){
            	String imprimir = request.getParameter("imprimirTermoDivida");
            	String texto = request.getParameter("textoTermoDivida");
            	conc.setImprimirTermoDivida(imprimir!=null);
            	conc.setTextoTermoDivida(texto);
            	cdao.salvar(conc);
            	cdao.commit();
            	cdao.close();
            	
            	return new ModelAndView("frames/success");
            }
        }
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    @Override
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        
    }
    
    
    @Override
    public ModelAndView onSubmit(Object command) throws ServletException {
        
    	return new ModelAndView(new RedirectView(getSuccessView()));
    }
}
