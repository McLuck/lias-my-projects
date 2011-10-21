package com.compsis.sigf.control;

import com.compsis.sigf.base.BaseTemp;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.dao.VersaoDAO;
import com.compsis.sigf.domain.Arrecadacao;
import com.compsis.sigf.domain.BASE;
import com.compsis.sigf.domain.Categoria;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.ConfiguracaoImagem;
import com.compsis.sigf.domain.Malote;
import com.compsis.sigf.domain.MeioPagamento;
import com.compsis.sigf.domain.ServidorBD;
import com.compsis.sigf.domain.Versao;

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
public class FormConcessionariaController extends SimpleFormController {

    private Concessionaria conc;
    private boolean novo = false;
    private ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
    
    public FormConcessionariaController() {
        setCommandClass(Concessionaria.class);
        setCommandName("conc");
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        conc = (Concessionaria) command;
        if (conc.getPhase() != null) {
            if (conc.getPhase().equals("1")) {
                if (conc.getId() == null) {
                    conc.setMeiosPagamento(new ArrayList<MeioPagamento>());
                    conc.setConfigArrecadacao(new Arrecadacao());
                    conc.setCategorias(BASE.LISTAS.CATEGORIAS);
                    conc.setMeiosPagamento(BASE.LISTAS.MEIOS_PAGAMENTO);
                    conc.setConfigImagem(new ConfiguracaoImagem());
                    conc.setConfigMalote(new Malote());
                    conc.setServidorBD(new ServidorBD());

                    
                    Object o = cdao.salvar(conc);
                    cdao.commit();
                    if(o instanceof Concessionaria){
                        conc = (Concessionaria)o;
                    }else if(o instanceof Integer){
                        conc.setId((Integer)o);
                    }
                    ModelAndView mav = new ModelAndView("frames/success2");
                    mav.addObject("msg", conc.getId());
                    mav.addObject("cid", conc.getId());
                    return mav;
                } else {
                    Concessionaria ccs = cdao.obter(conc.getId());
                    ccs.setNome(conc.getNome());
                    ccs.setCnpj(conc.getCnpj());
                    ccs.setNumeroCliente(conc.getNumeroCliente());
                    ccs.setNumeroPais(conc.getNumeroPais());
                    ccs.setOperacaoSA(conc.getOperacaoSA());
                    if (ccs.getOperacaoSA() == BASE.TIPOS.SA_CENTRALIZADO) {
                        ccs.setLink1(conc.getLink1());
                        ccs.setLink2(conc.getLink2());
                        ccs.setCapacidadeLink1(conc.getCapacidadeLink1());
                        ccs.setCapacidadeLink2(conc.getCapacidadeLink2());
                    }
                    Object o = cdao.salvar(ccs);
                    cdao.commit();
                    cdao.close();
                    if(o instanceof Concessionaria){
                        ccs = (Concessionaria)o;
                    }else if(o instanceof Integer){
                        ccs.setId((Integer)o);
                    }
                }

                ModelAndView mav = new ModelAndView("frames/success2");
                mav.addObject("msg", conc.getId());
                mav.addObject("cid", conc.getId());
                return mav;
            } else if (conc.getPhase().equals("2")) {
                Concessionaria ccs = cdao.obter(conc.getId());
                ccs.setCalculoCatEspecial(conc.getCalculoCatEspecial());
                ccs.setCalculoCatEspecialOutro(conc.getCalculoCatEspecialOutro());
                ccs.setCategoriaAmbigua(conc.isCategoriaAmbigua());
                ccs.setCorrecaoAutomaticaCatAmbigua(conc.isCorrecaoAutomaticaCatAmbigua());
                ccs.setPercentCorrecaoAutoCatAmb(conc.getPercentCorrecaoAutoCatAmb());
                cdao.salvar(ccs);
                cdao.commit();
                cdao.close();
                //BaseTemp.SALVAR(ccs);
                ModelAndView mav = new ModelAndView("frames/success");
                mav.addObject("cid", ccs.getId());
                return mav;
            }
        }
        ModelAndView mav = new ModelAndView("frames/error");
        return mav;
    }

    @Override
    protected Map referenceData(HttpServletRequest request) throws Exception {
        Map<Object, Object> dataMap = new HashMap<Object, Object>();
        String cid = request.getParameter("cid");
        Concessionaria ccs;// = (Concessionaria)BaseTemp.GET(conc.getId(), Concessionaria.class, null);
        if (cid == null || cid.equals("") || cid.equals("undefined")) {
            ccs = conc;
            dataMap.put("cid", conc.getId());
        } else {
            ccs = (Concessionaria) BaseTemp.GET(Integer.parseInt(cid), Concessionaria.class, null);
            dataMap.put("cid", cid);
        }

        if (ccs.getServidorBD() == null) {
            ccs.setServidorBD(new ServidorBD());
        }
        
        
        if (cid != null && !cid.equals("") && !cid.equals("undefined")) {
            if(ccs.getCategorias()==null || ccs.getCategorias().isEmpty()){
                ccs.setCategorias(BASE.LISTAS.ReplicarCategoriasPadroes(ccs));
                cdao.salvar(ccs);
                cdao.commit();
            }
            List<Categoria> lista = new ArrayList<Categoria>();
            for(Categoria c : ccs.getCategorias()){
                if(c!=null)lista.add(c);
            }
            dataMap.put("categorias", lista);
        }
        
        VersaoDAO vdao = (VersaoDAO) AFactoryDao.getInstance(VersaoDAO.class);;
        List<Versao> versoes = vdao.obterTodos();
        vdao.close();
        dataMap.put("versoes", BASE.LISTAS.SO_VERSAO);
        dataMap.put("idiomas", BASE.LISTAS.IDIOMAS);
        dataMap.put("edicoes", BASE.LISTAS.SO_EDICAO);
        dataMap.put("links", BASE.LISTAS.LINKS);
        dataMap.put("listVersoes", versoes);
        dataMap.put("porcentagensCooreAuto", BASE.LISTAS.PERCENTUAL_CORRECAO_AUTOMATICA_CATEGORIAS_AMBIGUAS);


        dataMap.put("categorias", BASE.LISTAS.CATEGORIAS);
        dataMap.put("tiposCat", BASE.LISTAS.TIPOS_CATEGORIA);
        dataMap.put("tipospista", BASE.LISTAS.TIPOS_PISTAS);
        dataMap.put("pracas", ccs.getPracas());

        return dataMap;
    }

    protected Object formBackingObject(HttpServletRequest request) throws Exception {
    	String cmd = request.getParameter("cmd");
        String cid = request.getParameter("cid");
        if (cid != null && !cid.equals("") && !cid.equals("undefined")) {
            conc = (Concessionaria) BaseTemp.GET(Integer.parseInt(cid), Concessionaria.class, null);
            novo = false;
        } else {
            conc = new Concessionaria();
            conc.setServidorBD(new ServidorBD());
            conc.setCategorias(BASE.LISTAS.ReplicarCategoriasPadroes(conc));
            conc.setMeiosPagamento(BASE.LISTAS.ReplicarMeiosPagamentosPadroes(conc));
            conc.setConfigImagem(new ConfiguracaoImagem());
            conc.setConfigMalote(new Malote());
            conc.setConfigArrecadacao(new Arrecadacao());
            Object o = cdao.salvar(conc);
            cdao.commit();
            cdao.clear();
            cdao.close();
            if(o instanceof Concessionaria){
                conc = (Concessionaria)o;
            }else if(o instanceof Integer){
                conc.setId((Integer)o);
            }
            novo = true;
        }
        if(cmd!=null && cmd.equals("saveConfigIMG")){
        	conc.getConfigImagem().setEstruturaDiretorio(Integer.parseInt(request.getParameter("configImagem.estruturaDiretorio")));
        	conc.getConfigImagem().setIpServer(request.getParameter("configImagem.ipServer"));
        	conc.getConfigImagem().setConcatenaCodigoUrl(request.getParameter("configImagem.concatenaCodigoUrl")!=null);
        	conc.getConfigImagem().setOrdemExibicaCrescente(request.getParameter("configImagem.ordemExibicaCrescente")!=null);
        	conc.getConfigImagem().setTransacaoCorrecaoImg(request.getParameter("configImagem.transacaoCorrecaoImg")!=null);
        	ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
        	cdao.salvar(conc);
        	cdao.commit();
        	cdao.close();
        	cdao.clear();
        }else if(cmd!=null && cmd.equals("cfgprc")){
        	conc.setAnosEstimativaTrafego(Integer.parseInt(request.getParameter("anosEstimativaTrafego")));
        	conc.setExibirDescricaoPracaRelatorios((request.getParameter("exibirDescricaoPracaRelatorios")!=null)?request.getParameter("exibirDescricaoPracaRelatorios").equals("true"):false);
        	cdao.salvar(conc);
        	cdao.commit();
        	cdao.close();
        }
        return conc;
    }
}
