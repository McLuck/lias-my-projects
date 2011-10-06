package com.compsis.sigf.control;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ArrecadacaoDAO;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.domain.Arrecadacao;
import com.compsis.sigf.domain.Concessionaria;

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
public class ArrecadacaoController extends SimpleFormController {
    private Arrecadacao arrec;
    private Concessionaria conc;
    private ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
    
    public ArrecadacaoController() {
        setCommandClass(Arrecadacao.class);
        setCommandName("arr");
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        arrec = (Arrecadacao) command;
        arrec.setId(conc.getConfigArrecadacao().getId());
        conc.setConfigArrecadacao(arrec);
        cdao.salvar(conc);
        cdao.commit();
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
        if(cid!=null && !cid.equals("") && !cid.equals("undefined")){
            conc = cdao.obter(Integer.parseInt(cid));
            arrec = conc.getConfigArrecadacao();
            return arrec;
        }else{
            conc = new Concessionaria();
            conc.setConfigArrecadacao(new Arrecadacao());
        }
        
        String id = request.getParameter("id");
        if (id != null) {
            ArrecadacaoDAO adao = (ArrecadacaoDAO) AFactoryDao.getInstance(ArrecadacaoDAO.class);
            this.arrec = adao.obter(Integer.parseInt(id));
        }
        if(arrec == null && conc !=null){
            arrec = conc.getConfigArrecadacao();
        }
        if(arrec==null){
            arrec = new Arrecadacao();
        }
        return arrec;
    }
}
