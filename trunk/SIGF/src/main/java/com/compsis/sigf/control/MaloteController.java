package com.compsis.sigf.control;
import com.compsis.sigf.base.BaseTemp;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.domain.Arrecadacao;
import com.compsis.sigf.domain.BASE;
import com.compsis.sigf.domain.Categoria;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Malote;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/**
 * Compsis
 * @author Lucas Israel
 * @see 05/08/2011
 * @version 1.0
 * 
 */
public class MaloteController  extends SimpleFormController {
    private Concessionaria conc;
    private ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
    private Malote mal;
    public MaloteController() {
        setCommandClass(Malote.class);
        setCommandName("mal");
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        mal = (Malote) command;
        mal.setId(conc.getConfigMalote().getId());
        conc.setConfigMalote(mal);
        cdao.salvar(conc);
        cdao.commit();
        cdao.close();
        
        ModelAndView mav = new ModelAndView("frames/success");
        return mav;


    }
/*
    @Override
    protected Map referenceData(HttpServletRequest request) throws Exception {
        Map<Object, Object> dataMap = new HashMap<Object, Object>();
        dataMap.put("tiposCat", BASE.LISTAS.TIPOS_CATEGORIA);
        if (BaseTemp.CONCESSIONARIA.getCategorias() == null) {
            BaseTemp.CONCESSIONARIA.setCategorias(BASE.LISTAS.CATEGORIAS);
        }
        dataMap.put("categorias", BaseTemp.CONCESSIONARIA.getCategorias());

        String cmd = request.getParameter("cmd");
        if (cmd != null) {
            if (cmd.equals("del")) {
                String id = request.getParameter("id");
                Categoria c = (Categoria) BaseTemp.GET(Integer.parseInt(id), Categoria.class, null);
                BaseTemp.REMOVE(c);
            }
        }

        return dataMap;
    */

    

    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        String cid = request.getParameter("cid");
        if(cid!=null && !cid.equals("undefined")){
            conc = cdao.obter(Integer.parseInt(cid));
            mal = conc.getConfigMalote();
            if(mal == null){
                mal = new Malote();
                conc.setConfigMalote(mal);
                cdao.salvar(conc);
                cdao.commit();
                conc = cdao.obter(Integer.parseInt(cid));
                mal = conc.getConfigMalote();
            }
            return mal;
        }
        String id = request.getParameter("id");
        if (id != null && !id.equals("undefined")) {
            return BaseTemp.GET(Integer.parseInt(id), Malote.class, null);
        }
        return new Malote();
    }
}
