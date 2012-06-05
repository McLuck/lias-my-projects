package com.compsis.sigf.control;

import com.compsis.sigf.base.BaseTemp;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.dao.ServidorBDDAO;
import com.compsis.sigf.domain.BASE;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.ServidorBD;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class ServerBDController extends SimpleFormController {

    private ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
    private Concessionaria conc;
    private ServidorBD server;
    private ServidorBDDAO sdao = (ServidorBDDAO) AFactoryDao.getInstance(ServidorBDDAO.class);

    public ServerBDController() {
        setCommandClass(ServidorBD.class);
        setCommandName("sgbd");
    }

    @Override
    protected Map referenceData(HttpServletRequest request) throws Exception {
        Map<Object, Object> dataMap = new HashMap<Object, Object>();

        dataMap.put("versoes", BASE.LISTAS.SO_VERSAO);
        dataMap.put("idiomas", BASE.LISTAS.IDIOMAS);
        dataMap.put("edicoes", BASE.LISTAS.SO_EDICAO);
        dataMap.put("links", BASE.LISTAS.LINKS);
        return dataMap;
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        server = (ServidorBD) command;

        conc.setServidorBD(server);
        cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
        cdao.salvar(conc);
        cdao.commit();

        ModelAndView mav = new ModelAndView("frames/success");

        return mav;
    }

    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        String cid = request.getParameter("cid");
        if (cid != null && !cid.equals("") && !cid.equals("undefined")) {
            conc = cdao.obter(Integer.parseInt(cid));
            server = conc.getServidorBD();
        }
        String cmd = request.getParameter("cmd");
        if (cmd != null) {
            if (cmd.equals("get")) {
                String id = request.getParameter("id");
                if (id != null && !id.equals("") && !id.equals("undefined")) {
                    server = sdao.obter(Integer.parseInt(id));
                    return server;
                }
                if (cid != null && !cid.equals("") && !cid.equals("undefined")) {
                    if (server == null) {
                        server = new ServidorBD();
                        conc.setServidorBD(server);
                    }
                    return server;
                }
            }
        }

        return new ServidorBD();
    }
}
