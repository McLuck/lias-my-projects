package com.compsis.sigf.control;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.dao.ConfiguracaoImagemDAO;
import com.compsis.sigf.domain.BASE;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.ConfiguracaoImagem;
import com.compsis.sigf.domain.ServidorBD;
import com.compsis.sigf.domain.TipoPista;
import com.compsis.sigf.domain.TipoTransacao;

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
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class ConfiguracaoController extends SimpleFormController {

    private ConfiguracaoImagem confimg = new ConfiguracaoImagem();
    private Concessionaria conc;
    private ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);

    public ConfiguracaoController() {
        setCommandClass(ConfiguracaoImagem.class);
        setCommandName("confimg");
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        confimg = (ConfiguracaoImagem) command;
        if (confimg != null) {
            conc.setConfigImagem(confimg);
            confimg.setConcessionaria(conc);
            cdao.salvar(conc);
            cdao.commit();
            ModelAndView mav = new ModelAndView("frames/success");
            return mav;
        }
        ModelAndView mav = new ModelAndView("frames/error");
        return mav;
    }

    @Override
    protected Map referenceData(HttpServletRequest request) throws Exception {
        Map<Object, Object> dataMap = new HashMap<Object, Object>();
        if (conc.getServidorBD() == null) {
            conc.setServidorBD(new ServidorBD());
        }


        dataMap.put("tipostransacao", BASE.LISTAS.TIPOS_TRANSACAO);
        dataMap.put("pracas", conc.getPracas());

        return dataMap;
    }

    protected Object formBackingObject(HttpServletRequest request) throws Exception {

        if (request.getParameter("cmd") != null && request.getParameter("cmd").equals("chb")) {
            tratarAquisicoes(request);
        }
        if (conc == null) {
            String cid = request.getParameter("cid");
            conc = cdao.obter(Integer.parseInt(cid));
            confimg = conc.getConfigImagem();
        }
        if (conc.getConfigImagem() == null) {
            this.confimg = new ConfiguracaoImagem();
            confimg.setTipoPista(BASE.LISTAS.ReplicateTipoPistasPadroes(confimg));
            confimg.setTiposTransacoes(BASE.LISTAS.ReplicateTipoTransacaoPadroes(confimg));
            conc.setConfigImagem(confimg);

            ConfiguracaoImagemDAO cfgD = (ConfiguracaoImagemDAO) AFactoryDao.getInstance(ConfiguracaoImagemDAO.class);
            Object o = cfgD.salvar(confimg);
            cfgD.commit();
            if (o instanceof ConfiguracaoImagem) {
                confimg = (ConfiguracaoImagem) o;
            } else if (o instanceof Integer) {
                confimg.setId((Integer) o);
            }

            return confimg;
        } else {
            confimg = conc.getConfigImagem();
            if (confimg.getTipoPista() == null || confimg.getTipoPista().isEmpty()) {
                confimg.setTipoPista(BASE.LISTAS.ReplicateTipoPistasPadroes(confimg));
                confimg.setTiposTransacoes(BASE.LISTAS.ReplicateTipoTransacaoPadroes(confimg));
                conc.setConfigImagem(confimg);


                ConfiguracaoImagemDAO cfgD = (ConfiguracaoImagemDAO) AFactoryDao.getInstance(ConfiguracaoImagemDAO.class);
                Object o = cfgD.salvar(confimg);
                cfgD.commit();
                if (o instanceof ConfiguracaoImagem) {
                    confimg = (ConfiguracaoImagem) o;
                } else if (o instanceof Integer) {
                    confimg.setId((Integer) o);
                }
            }
            return confimg;
        }
    }

    private void tratarAquisicoes(HttpServletRequest request) {
        if (conc == null) {
            String cid = request.getParameter("cid");
            conc = cdao.obter(Integer.parseInt(cid));
        }
        if (conc != null && conc.getConfigImagem() != null && conc.getConfigImagem().getTipoPista() != null) {

            String img1 = "imgVAS";
            String img2 = "imgVES";
            String img3 = "imgVAES";
            String img4 = "imgOCR";
            String img5 = "imgVBS";

            String ttrs = "adquireImagem";
            List<TipoPista> lista = new ArrayList<TipoPista>();
            confimg = conc.getConfigImagem();

            for (TipoPista tp : confimg.getTipoPista()) {
                if (tp == null) {
                    continue;
                }
                if (request.getParameter(img1 + tp.getId()) == null) {
                    tp.setImgVAS(false);
                } else {
                    tp.setImgVAS(true);
                }
                if (request.getParameter(img2 + tp.getId()) == null) {
                    tp.setImgVES(false);
                } else {
                    tp.setImgVES(true);
                }
                if (request.getParameter(img3 + tp.getId()) == null) {
                    tp.setImgVAES(false);
                } else {
                    tp.setImgVAES(true);
                }
                if (request.getParameter(img4 + tp.getId()) == null) {
                    tp.setImgOCR(false);
                } else {
                    tp.setImgOCR(true);
                }
                if (request.getParameter(img5 + tp.getId()) == null) {
                    tp.setImgVBS(false);
                } else {
                    tp.setImgVBS(true);
                }
                lista.add(tp);
            }
            List<TipoTransacao> listaT = new ArrayList<TipoTransacao>();
            for (TipoTransacao tt : confimg.getTiposTransacoes()) {
                if (tt == null) {
                    continue;
                }
                if (request.getParameter(ttrs + tt.getId()) != null) {
                    tt.setAdquireImagem(true);
                } else {
                    tt.setAdquireImagem(false);
                }
                listaT.add(tt);
            }
            confimg.setTipoPista(lista);
            confimg.setTiposTransacoes(listaT);
            ConfiguracaoImagemDAO cfg = (ConfiguracaoImagemDAO) AFactoryDao.getInstance(ConfiguracaoImagemDAO.class);
            cfg.setEvit(true);
            cfg.salvar(confimg);
            cfg.commit();
            //conc.setConfigImagem(confimg);
            //cdao.salvar(conc);
            //cdao.commit();
        }
    }

    /**
     * @return the confimg
     */
    public ConfiguracaoImagem getConfimg() {
        return confimg;
    }

    /**
     * @param confimg the confimg to set
     */
    public void setConfimg(ConfiguracaoImagem confimg) {
        this.confimg = confimg;
    }
}
