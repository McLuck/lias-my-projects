package com.compsis.sigf.control;

import com.compsis.sigf.base.BaseTemp;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.dao.ConfiguracaoPracaDAO;
import com.compsis.sigf.dao.PracaDAO;
import com.compsis.sigf.domain.AntenaPista;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.ConfiguracaoPraca;
import com.compsis.sigf.domain.Praca;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
public class ConfiguracaoPracaController extends SimpleFormController {

    private ConfiguracaoPraca conf;
    private ConfiguracaoPracaDAO cdao = (ConfiguracaoPracaDAO) AFactoryDao.getInstance(ConfiguracaoPracaDAO.class);
    Praca praca;
    PracaDAO pdao = (PracaDAO) AFactoryDao.getInstance(PracaDAO.class);

    public ConfiguracaoPracaController() {
        setCommandClass(ConfiguracaoPraca.class);
        setCommandName("confp");
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        conf = (ConfiguracaoPraca) command;

        if (conf.getPhase() != null) {
            if (conf.getPhase().equals("1")) {
                if (conf.getId() == 0) {
                    Praca p = (Praca) BaseTemp.GET(conf.getPracaid(), Praca.class, null);
                    conf.setPraca(p);
                    p.setConfiguracao(conf);
                }
                cdao.salvar(conf);
                cdao.commit();
                cdao.clear();
                cdao.close();
                pdao.clear();
                pdao.close();
                //BaseTemp.SALVAR(conf);
                ModelAndView mav = new ModelAndView("frames/success");
                return mav;
            }

        }
        ModelAndView mav = new ModelAndView("selecionaPraca");
        return mav;
    }

    /*@Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    String cmd = request.getParameter("cmd");
    if (cmd != null) {
    if (cmd.equals("getPracas")) {
    ModelAndView mav = new ModelAndView("selecionaPraca");
    mav.addObject("pracas", BaseTemp.CONCESSIONARIA.getPracas());
    return mav;
    }else if(cmd.equals("getp")){
    String pid = request.getParameter("pid");
    }
    }
    
    return handleInvalidSubmit(request, response);
    }*/
    @Override
    protected Map referenceData(HttpServletRequest request) throws Exception {
        Map<Object, Object> dataMap = new HashMap<Object, Object>();


        String id = request.getParameter("pid");
        String cid = request.getParameter("cid");
        if (cid != null && !cid.equals("undefined") && !cid.equals("")) {
            ConcessionariaDAO csdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
            Concessionaria conc = csdao.obter(Integer.parseInt(cid));
            dataMap.put("pracas", conc.getPracas());
            if (id != null && !id.equals("undefined") && !id.equals("")) {
                for (Praca p : conc.getPracas()) {
                    if (p != null) {
                        if (p.getId() == Integer.parseInt(id)) {
                            conf = p.getConfiguracao();
                        }
                    }
                }

                List<AntenaPista> lista = new ArrayList<AntenaPista>();
                if (conf.getAntenaPista() != null) {
                    for (AntenaPista a : conf.getAntenaPista()) {
                        if (a != null) {
                            lista.add(a);
                        }
                    }
                }

                dataMap.put("antenas", lista);
                dataMap.put("pracaid", id);
                dataMap.put("pid", id);
                dataMap.put("cid", cid);
            }
        }
        return dataMap;
    }

    protected Object formBackingObject(HttpServletRequest request) throws Exception {

        if (request.getParameter("c") != null && request.getParameter("c").equals("submit")) {
            return super.formBackingObject(request);
        }

        String id = request.getParameter("id");
        String pid = request.getParameter("pid");
        if (id != null && !id.equals("undefined")) {
            return BaseTemp.GET(Integer.parseInt(id), ConfiguracaoPraca.class, null);
        } else if (pid != null) {
            if (!pid.equals("undefined") && !pid.equals("")) {
                praca = pdao.obter(Integer.parseInt(pid));
                conf = praca.getConfiguracao();
                return conf;
            }
            return new ConfiguracaoPraca();
        }

        return new ConfiguracaoPraca();
    }
}
