package com.compsis.sigf.control;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.AntenaPistaDAO;
import com.compsis.sigf.dao.PracaDAO;
import com.compsis.sigf.domain.AntenaPista;
import com.compsis.sigf.domain.ConfiguracaoPraca;
import com.compsis.sigf.domain.Praca;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.ModelAndView;

/**
 * Compsis
 * @author Lucas Israel
 * @see 05/08/2011
 * @version 1.0
 * 
 */
public class AntenaPracaConfiguration  extends SimpleFormController {
    private PracaDAO pdao = (PracaDAO) AFactoryDao.getInstance(PracaDAO.class);
    private Praca praca;
    private ConfiguracaoPraca config;
    public AntenaPracaConfiguration() {
        setCommandClass(AntenaPista.class);
        setCommandName("atn");
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        AntenaPista at = (AntenaPista) command;
        at.setConfiguracaoPraca(config);
        
        praca.getConfiguracao().getAntenaPista().add(at);

        pdao.salvar(praca);
        pdao.commit();
        ModelAndView mav = new ModelAndView("frames/success");
        return mav;
    }

    @Override
    protected Map referenceData(HttpServletRequest request) throws Exception {
        Map<Object, Object> dataMap = new HashMap<Object, Object>();

        String id = request.getParameter("pid");
        if (id != null && !id.equals("undefined")) {
            praca = pdao.obter(Integer.parseInt(id));
            config = praca.getConfiguracao();
            if(config==null){
                config = new ConfiguracaoPraca();
            }
            if(config.getAntenaPista() == null){
                config.setAntenaPista(new ArrayList<AntenaPista>());
            }
            dataMap.put("antenas", config.getAntenaPista());
            dataMap.put("pracaid", id);
        }
        
        return dataMap;
    }

    
    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        String cmd = request.getParameter("cmd");
        if(cmd!=null){
            if(cmd.equals("")){
                
            }
        }
        String pid = request.getParameter("pid");
        if (pid != null && !pid.equals("undefined")) {
            praca = pdao.obter(Integer.parseInt(pid));
            config = praca.getConfiguracao();
        }
        
        String id = request.getParameter("id");
        if (id != null && !id.equals("undefined")) {
            AntenaPistaDAO adao = (AntenaPistaDAO) AFactoryDao.getInstance(AntenaPistaDAO.class);
            AntenaPista at;
            at = adao.obter(Integer.parseInt(id));
            if(at==null){
                return new AntenaPista();
            }
            return at;
        }

        return new AntenaPista();
    }
}
