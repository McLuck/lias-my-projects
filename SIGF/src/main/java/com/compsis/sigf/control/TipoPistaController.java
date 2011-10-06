
package com.compsis.sigf.control;

import com.compsis.sigf.base.BaseTemp;
import com.compsis.sigf.domain.BASE;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.ConfiguracaoImagem;
import com.compsis.sigf.domain.ServidorBD;
import com.compsis.sigf.domain.TipoPista;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.ModelAndView;

/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class TipoPistaController extends SimpleFormController {

    public TipoPistaController() {
        setCommandClass(TipoPista.class);
        setCommandName("tppista");
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        TipoPista tp = (TipoPista) command;
        if (tp != null) {
            BaseTemp.SALVAR(tp);
            ModelAndView mav = new ModelAndView("frames/success");
            return mav;
        }
        ModelAndView mav = new ModelAndView("frames/error");
        return mav;
    }

    @Override
    protected Map referenceData(HttpServletRequest request) throws Exception {
        Map<Object, Object> dataMap = new HashMap<Object, Object>();
        if (BaseTemp.CONCESSIONARIA.getServidorBD() == null) {
            BaseTemp.CONCESSIONARIA.setServidorBD(new ServidorBD());
        }

        dataMap.put("versoes", BASE.LISTAS.SO_VERSAO);
        dataMap.put("idiomas", BASE.LISTAS.IDIOMAS);
        dataMap.put("edicoes", BASE.LISTAS.SO_EDICAO);
        dataMap.put("links", BASE.LISTAS.LINKS);
        dataMap.put("porcentagensCooreAuto", BASE.LISTAS.PERCENTUAL_CORRECAO_AUTOMATICA_CATEGORIAS_AMBIGUAS);


        dataMap.put("categorias", BASE.LISTAS.CATEGORIAS);
        dataMap.put("tiposCat", BASE.LISTAS.TIPOS_CATEGORIA);
        dataMap.put("tipospista", BASE.LISTAS.TIPOS_PISTAS);
        dataMap.put("pracas", BaseTemp.CONCESSIONARIA.getPracas());

        return dataMap;
    }

    @Override
    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        if (BaseTemp.CONCESSIONARIA == null) {
            BaseTemp.INIT_BASE();
        }
        if (BaseTemp.CONCESSIONARIA.getConfigImagem() == null) {
            ConfiguracaoImagem conf = new ConfiguracaoImagem();
            conf.setTipoPista(BASE.LISTAS.TIPOS_PISTAS);
            BaseTemp.CONCESSIONARIA.setConfigImagem(conf);
            return new TipoPista();
        } else {
            if (BaseTemp.CONCESSIONARIA.getConfigImagem().getTipoPista() == null) {
                BaseTemp.CONCESSIONARIA.getConfigImagem().setTipoPista(BASE.LISTAS.TIPOS_PISTAS);
            }
            String id = request.getParameter("id");
            if(id!=null){
                return BaseTemp.GET(Integer.parseInt(id), TipoPista.class, null);
            }else{
                return new TipoPista();
            }
        }
    }
}
