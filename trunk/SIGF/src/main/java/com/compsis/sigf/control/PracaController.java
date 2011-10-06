
package com.compsis.sigf.control;

import javax.servlet.http.HttpServletRequest;
import com.compsis.sigf.base.BaseTemp;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.PracaDAO;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.ConfiguracaoPraca;
import com.compsis.sigf.domain.Praca;

import java.util.HashMap;
import java.util.Map;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class PracaController extends SimpleFormController  {
    private Concessionaria conc;
    private Praca prc;
    public PracaController(){
        setCommandClass(Praca.class);
        setCommandName("praca");
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        Praca p = (Praca)command;
        if(p.getConcessionaria()==null){
            p.setConcessionaria(conc);
        }
        if(p.getPrcSent1()!=null){
        	try{
        		String pc1 = p.getPrcSent1();
        		if(pc1.length()>=2){
        			//SP, Sao Paulo
        			String siglaSent1 = pc1.substring(0, 2);
        			p.setSiglaSentido1(siglaSent1);
        			
        			if(pc1.length()>3){
        				String sent1 = pc1.substring(3, pc1.length()).trim();
            			p.setSentido1(sent1);
        			}
        		}
        	}catch(Exception e){
        	}
        }
        if(p.getPrcSent2()!=null){
        	try{
        		String pc2 = p.getPrcSent2();
        		if(pc2.length()>=2){
        			String sigla = pc2.substring(0, 2);
        			p.setSiglaSentido2(sigla);
        			
        			if(pc2.length()>3){
        				String sent2 = pc2.substring(3, pc2.length()).trim();
        				p.setSentido2(sent2);
        			}
        		}
        	}catch(Exception e){
        		
        	}
        }
        if(p.getConfiguracao()==null){
            p.setConfiguracao(new ConfiguracaoPraca());
            p.getConfiguracao().setPraca(p);   
        }
        PracaDAO pdao = (PracaDAO) AFactoryDao.getInstance(PracaDAO.class);
        pdao.setChache(false);
        try{
        	Praca p2 = pdao.obter(p.getId());
        	p.setPracaMeiosPgto(p2.getPracaMeiosPgto());
        }catch(Exception ex){
        }
        pdao.close();
        pdao.clear();
        //pdao.setEvit(true);
        Object o = pdao.salvar(p);
        pdao.commit();
        pdao.close();
        if(o instanceof Praca){
            p = (Praca)o;
        }else if(o instanceof Integer){
            p.setId((Integer)o);
        }
        ModelAndView mav = new ModelAndView("frames/success2");
        mav.addObject("cid", conc.getId());
        mav.addObject("msg", p.getId());
        return mav;
    }

    @Override
    protected Map referenceData(HttpServletRequest request) throws Exception {
    	request.setCharacterEncoding("ISO-8859-1");
    	Map<Object, Object> dataMap = new HashMap<Object, Object>();
        String cid = request.getParameter("cid");
        if(cid!=null && !cid.equals("undefined")){
            dataMap.put("cid", cid);
        }
    	return dataMap;
    }

    @Override
    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        request.setCharacterEncoding("ISO-8859-1");
        String pracaid = request.getParameter("pracaid");
        String cid = request.getParameter("cid");
        if(pracaid!=null && !pracaid.equals("undefined")){
        	PracaDAO pdao = (PracaDAO) AFactoryDao.getInstance(PracaDAO.class);
        	pdao.close();
        	pdao.clear();
        	pdao.setChache(true);
        	prc = pdao.obter(Integer.parseInt(pracaid));
        	String p11 = ((prc.getSiglaSentido1()!=null)?prc.getSiglaSentido1():"  ").concat(", ").concat((prc.getSentido1()!=null)?prc.getSentido1():"");
        	String p12 = ((prc.getSiglaSentido2()!=null)?prc.getSiglaSentido2():"  ").concat(", ").concat((prc.getSentido2()!=null)?prc.getSentido2():"");
        	
        	prc.setPrcSent1(p11);
        	prc.setPrcSent2(p12);
            //prc = (Praca) BaseTemp.GET(Integer.parseInt(pracaid), Praca.class, null);
            return prc;
        }
        if(cid!=null && !cid.equals("undefined")){
            conc = (Concessionaria)BaseTemp.GET(Integer.parseInt(cid), Concessionaria.class, null);
        }
        prc = new Praca();
        return prc;
    }
}
