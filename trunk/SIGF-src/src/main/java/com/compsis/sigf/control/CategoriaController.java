package com.compsis.sigf.control;

import com.compsis.sigf.base.BaseTemp;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.CategoriaDAO;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.domain.BASE;
import com.compsis.sigf.domain.Categoria;
import com.compsis.sigf.domain.Concessionaria;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
public class CategoriaController extends SimpleFormController {

    private Concessionaria conc;
    private ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
    private CategoriaDAO catDao = (CategoriaDAO) AFactoryDao.getInstance(CategoriaDAO.class);;
    private Categoria cat;

    public CategoriaController() {
        setCommandClass(Categoria.class);
        setCommandName("cat");
    }
    
    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        cat = (Categoria) command;
        String validate = validate(cat);
        if (validate.equals("success")) {
            cat.setConcessionaria(conc);
            catDao.salvar(cat);
            catDao.commit();
            catDao.close();
            ModelAndView mav = new ModelAndView("frames/success");
            return mav;
        }

        ModelAndView mav = new ModelAndView("frames/error");
        return mav;
    }

    @Override
    protected Map referenceData(HttpServletRequest request) throws Exception {
        Map<Object, Object> dataMap = new HashMap<Object, Object>();
        dataMap.put("tiposCat", BASE.LISTAS.TIPOS_CATEGORIA);

        String cmd = request.getParameter("cmd");
        if (cmd != null) {
            if (cmd.equals("del")) {
                String id = request.getParameter("id");
                cat = catDao.obter(Integer.parseInt(id));
                Concessionaria conc = cat.getConcessionaria();
                conc.getCategorias().remove(cat);
                ConcessionariaDAO.getInstance().atualizar(conc);
                ConcessionariaDAO.getInstance().commit();
                ConcessionariaDAO.getInstance().close();
            }
        }
        String cid = request.getParameter("cid");
        if (cid != null && !cid.equals("") && !cid.equals("undefined")) {
            dataMap.put("cid", cid);
            conc = cdao.obter(Integer.parseInt(cid));
            if(conc.getCategorias()==null || conc.getCategorias().isEmpty()){
                conc.setCategorias(BASE.LISTAS.ReplicarCategoriasPadroes(conc));
                cdao.salvar(conc);
                cdao.commit();
            }
            List<Categoria> lista = new ArrayList<Categoria>();
            for(Categoria c : conc.getCategorias()){
                if(c!=null)lista.add(c);
            }
            dataMap.put("categorias", lista);
        } else {
            
        }

        return dataMap;
    }

    private String validate(Categoria c) {
        if (c == null) {
            return "Categoria não nula!";
        }
        if (c.getEf() == 0) {
            return "EF nao foi definido corretamente.";
        }
        if (c.getTipo() == 0) {
            return "Tipo da categoria nao foi definido.";
        }
        if (c.getId() == 0) {
            return "ID da categoria nao foi definida.";
        }
        if (c.getModelo() == null || c.getModelo().equals("")) {
            c.setModelo("-");
        }

        return "success";
    }

    @Override
    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        String cmd = request.getParameter("cmd");
        String cid = request.getParameter("cid");
        if (cid != null && !cid.equals("") && !cid.equals("undefined")) {
            this.conc = cdao.obter(Integer.parseInt(cid));
        }

        if (cmd != null) {
            if (cmd.equals("get")) {
                String id = request.getParameter("id");
                cat = catDao.obter(Integer.parseInt(id));
                return cat;
            }
        }
        return new Categoria();
    }
}
