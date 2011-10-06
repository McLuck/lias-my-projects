package com.compsis.sigf.control;

import javax.servlet.http.HttpServletRequest;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.PistaDAO;
import com.compsis.sigf.dao.PracaDAO;
import com.compsis.sigf.domain.BASE;
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
        
        pista.setPraca(praca);

        ModelAndView mav = null;
        String validate = validate(pista);
        
        if (validate.equals("success")) {
            psDao.salvar(pista);
            psDao.commit();
            psDao.close();
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

        if (p.getPraca() != null) {
            if (p.getPraca().getPistas() != null) {
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
            }
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
        List<Pista> pistas;
        if(praca==null){
        	praca = prDao.obter(Integer.parseInt(pracaid));
            pistas = new ArrayList<Pista>();
            for(Pista pts : praca.getPistas()){
            	if(pts!=null){
            		pistas.add(pts);
            	}
            }	
        }else{
        	pistas = praca.getPistas();
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
                praca = pista.getPraca();
                return pista;
            }
        }
        pista = new Pista();
        if(request.getParameter("pracaid")!=null){
            String prid = request.getParameter("pracaid");
            prid = prid.replace(" ", "");
            prid = prid.replace("\n", "");
            praca = prDao.obter(Integer.parseInt(prid));
        }
        pista.setPraca(praca);
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
