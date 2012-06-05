package com.compsis.sigf.control;

import javax.servlet.http.HttpServletRequest;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.dao.LocalizacaoDAO;
import com.compsis.sigf.dao.PistaDAO;
import com.compsis.sigf.dao.PracaDAO;
import com.compsis.sigf.domain.BASE;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Localizacao;
import com.compsis.sigf.domain.Pista;
import com.compsis.sigf.domain.Praca;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
public class PistaController extends SimpleFormController {

    private Praca praca;
    private Localizacao local;
    public Localizacao getLocal() {
		return local;
	}

	public void setLocal(Localizacao local) {
		this.local = local;
	}
	private Pista pista;
    private PracaDAO prDao = (PracaDAO) AFactoryDao.getInstance(PracaDAO.class);
    private PistaDAO psDao = (PistaDAO) AFactoryDao.getInstance(PistaDAO.class);

    public PistaController() {
        setCommandClass(Pista.class);
        setCommandName("pista");
    }
    private String pracaid;

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        pista = (Pista) command;
        prDao.clear();
        prDao.close();
        prDao.setChache(false);
        psDao.setChache(false);
        psDao.clear();
        psDao.close();
        pista.setLocalizacao(local);
        /*pista.setPraca(praca);*/

        ModelAndView mav = null;
        String validate = validate(pista);
        
        if (validate.equals("success")) {
            psDao.salvar(pista);
            psDao.commit();
            psDao.close();
            
            if(pista.getTipo()==BASE.TIPOS.TIPO_PISTA_AUTOMATICA && praca!=null && praca.getConcessionaria()!=null){
            	Concessionaria conc = praca.getConcessionaria();
            	conc.setExisteAVI(true);
            	ConcessionariaDAO cdao = (ConcessionariaDAO)AFactoryDao.getInstance(ConcessionariaDAO.class);
            	cdao.atualizar(conc);
            	cdao.commit();
            	cdao.close();
            }
            
            mav = new ModelAndView("frames/success");
        } else {
            mav = new ModelAndView("frames/error");
            mav.addObject("msg", validate);
        }
        return mav;
    }

    private String validate(Pista p) {
        if (p == null) {
            return "Pista não encontrada";
        }
        if(p.getLocalizacao()==null){
        	return "Nenhuma praca foi especificada para esta pista.";
        	/*if (p.getLocalizacao().getPraca() != null) {
        		
            if (p.getLocalizacao().getPraca().getPistas() != null) {
                for (Pista pt : p.getPraca().getPistas()) {
                    if(pt==null){
                        continue;
                    }
                    if (pt.getIpMaquina()!=null && p.getIpMaquina()!=null && pt.getIpMaquina().equals(p.getIpMaquina())) {
                        if (p.getId() != pt.getId()) {
                            return "Existe outra pista nesta praça com o IP solicitado. Registre um novo IP.";
                        }
                    }
                    if (pt.getNomeMaquina()!=null && p.getNomeMaquina()!=null && pt.getNomeMaquina().equals(p.getNomeMaquina())) {
                        if (p.getId() != pt.getId()) {
                            return "Existe outra pista nesta praça com o nome solicitado. Registre um novo nome.";
                        }
                    }
                }
            }}*/
        }
        
        return "success";
    }

    @Override
    protected Map referenceData(HttpServletRequest request) throws Exception {
    	prDao.clear();
        prDao.close();
        prDao.setChache(false);
        psDao.setChache(false);
        psDao.clear();
        psDao.close();
        
        pracaid = request.getParameter("pracaid");
        if (pracaid == null) {
            return super.referenceData(request);
        }
        Map<Object, Object> dataMap = new HashMap<Object, Object>();
        dataMap.put("tipospista", BASE.LISTAS.TIPOS_PISTAS);
        dataMap.put("pracaid", pracaid);
        pracaid = pracaid.replace(" ", "");
        pracaid = pracaid.replace("\n", "");
        List<Pista> pistas = new ArrayList<Pista>();;
        if(praca==null){
        	praca = prDao.obter(Integer.parseInt(pracaid));
            
        }
        if(praca.getLocalizacoes()!=null){
        	for(Localizacao loc : praca.getLocalizacoes()){
        		if(loc!=null){
        			for(Pista pts : loc.getPistas()){
                    	if(pts!=null){
                    		pistas.add(pts);
                    	}
                    }
        		}
            }
        }
        
        dataMap.put("pistas", pistas);
        
        return dataMap;
    }

    @Override
    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        if (request.getParameter("id") != null) {
            int id = (Integer.parseInt(request.getParameter("id")));
            if (id == 0) {
                return super.formBackingObject(request);
            }else{
                pista = psDao.obter(id);
                local = pista.getLocalizacao();
                praca = local.getPraca();
                return pista;
            }
        }
        pista = new Pista();
        if(request.getParameter("localid")!=null){
        	try{
        		String locid = request.getParameter("localid");
                locid = locid.replace(" ", "");
                locid = locid.replace("\n", "");
                LocalizacaoDAO ldao = (LocalizacaoDAO)AFactoryDao.getInstance(LocalizacaoDAO.class);
                local = ldao.obter(Integer.parseInt(locid));
        	}catch(Exception e){
        	}
        }
        if(local!=null){
        	pista.setLocalizacao(local);
        	return pista;
        }
        if(request.getParameter("pracaid")!=null){
            String prid = request.getParameter("pracaid");
            prid = prid.replace(" ", "");
            prid = prid.replace("\n", "");
            praca = prDao.obter(Integer.parseInt(prid));
            if(praca.getLocalizacoes()!=null && !praca.getLocalizacoes().isEmpty()){
            	for(Localizacao lc : praca.getLocalizacoes()){
            		if(lc !=null){
            			pista.setLocalizacao(lc);
            			return pista;
            		}
            	}
            }
        }
        return pista;
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
}
