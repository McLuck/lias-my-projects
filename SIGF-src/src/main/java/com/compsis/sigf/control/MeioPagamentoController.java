package com.compsis.sigf.control;

import com.compsis.sigf.base.BaseTemp;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.dao.MeioPagamentoDAO;
import com.compsis.sigf.dao.PracaDAO;
import com.compsis.sigf.dao.PracaMeioPagamentoDAO;
import com.compsis.sigf.domain.BASE;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.ConfigContato;
import com.compsis.sigf.domain.ConfigEquipamento;
import com.compsis.sigf.domain.ConfiguracaoImagem;
import com.compsis.sigf.domain.MeioPagamento;
import com.compsis.sigf.domain.Praca;
import com.compsis.sigf.domain.PracaMeioPagamento;
import com.compsis.sigf.domain.PracaMeioPgtoView;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.ModelAndView;

/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class MeioPagamentoController extends SimpleFormController {

    private MeioPagamento meioP;
    private MeioPagamentoDAO mdao = (MeioPagamentoDAO) AFactoryDao.getInstance(MeioPagamentoDAO.class);
    private Concessionaria conc;
    private ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
    private List<PracaMeioPagamento> utilizadas;
    private List<MeioPagamento> disponiveis;

    public MeioPagamentoController() {
        setCommandClass(MeioPagamento.class);
        setCommandName("mp");
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        ConfiguracaoImagem conf = (ConfiguracaoImagem) command;
        if (conf != null) {
            BaseTemp.SALVAR(conf);
            ModelAndView mav = new ModelAndView("frames/success");
            return mav;
        }
        ModelAndView mav = new ModelAndView("frames/error");
        return mav;
    }

    @Override
    protected Map referenceData(HttpServletRequest request) throws Exception {
        Map<Object, Object> dataMap = new HashMap<Object, Object>();
        String cid = request.getParameter("cid");
        if (cid != null && !cid.equals("") && !cid.equals("undefined")) {
            dataMap.put("cid", cid);
            conc = cdao.obter(Integer.parseInt(cid));
            //Filtra primeira posicao da lista (Evita null para primeiro elemento carregado - lazy)
            List<MeioPagamento> l = new ArrayList<MeioPagamento>();
            if (conc.getMeiosPagamento() != null && !conc.getMeiosPagamento().isEmpty()) {
                for (MeioPagamento mp : conc.getMeiosPagamento()) {
                    if (mp == null) {
                        continue;
                    }
                    l.add(mp);
                }
            } else {
                //Caso nao tenha meios de pagamentos, carrega lista padrao de meios de pagamentos e salva.
                conc.setMeiosPagamento(BASE.LISTAS.ReplicarMeiosPagamentosPadroes(conc));
                cdao.salvar(conc);
                cdao.commit();
                cdao.close();
                l = conc.getMeiosPagamento();
            }
            dataMap.put("mps", l);
        }
        return dataMap;
    }

    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse hsr1) throws Exception {

        String id = request.getParameter("id");
        String cid = request.getParameter("cid");
        String cmd = request.getParameter("cmd");
        if (cmd != null && id != null && !id.equals("undefined") && !cmd.equals("undefined")) {
            if (cmd.equals("loadConfig")) {
                ModelAndView mav = new ModelAndView("frames/frameConfigMp");
                meioP = mdao.obter(Integer.parseInt(id));
                mav.addObject("mp", meioP);
                return mav;
            } else if (cmd.equals("loadConfigMPPRACA")) {
                ModelAndView mav = new ModelAndView("frames/pracaMP");
                meioP = mdao.obter(Integer.parseInt(id));
                mav.addObject("mp", meioP);
                mav.addObject("cid", cid);
                PracaDAO pdao = (PracaDAO) AFactoryDao.getInstance(PracaDAO.class);
                //List<Praca> pracas = pdao.obterTodos();
                List<Praca> pracas = pdao.getByConcessionaria(Integer.parseInt(cid));
                List<PracaMeioPgtoView> listaPMP = new ArrayList<PracaMeioPgtoView>();
                for (Praca pc : pracas) {
                    if (pc == null) {
                        continue;
                    }
                    PracaMeioPgtoView pmv = new PracaMeioPgtoView(meioP, pc);
                    listaPMP.add(pmv);
                }
                mav.addObject("pracas", listaPMP);
                return mav;
            }
        }

        return super.handleRequest(request, hsr1);
    }

    @Override
    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        String cmd = request.getParameter("cmd");
        if (request.getParameter("id") != null && !request.getParameter("id").equals("undefined") && !request.getParameter("id").isEmpty()) {
            meioP = mdao.obter(Integer.parseInt(request.getParameter("id")));
        }
        if (cmd != null && cmd.equals("cfg")) {
            tratarDependencias(request);
        } else if (cmd != null && cmd.equals("saveAll")) {
            tratarMPsAtivos(request);
        } else if (cmd != null && cmd.equals("savePgtoPraca")) {
            //Fazer tratamento para multiplos
            meioP = mdao.obter(Integer.parseInt(request.getParameter("id")));
            tratarPracasMeiosPagamentos(request);
        }
        if (meioP != null) {
            return meioP;
        }
        return new MeioPagamento(true, true);
    }

    private void tratarPracasMeiosPagamentos(HttpServletRequest request) {
        String ativo = "ativo_";
        String codPraca = "codLocal_";
        String cid = request.getParameter("cid");
        
        //Apaga todas as relacoes com a praca.
        PracaMeioPagamentoDAO mpdao = (PracaMeioPagamentoDAO) AFactoryDao.getInstance(PracaMeioPagamentoDAO.class);
        mpdao.deleteAllPracasFromMP(meioP.getId(), Integer.parseInt(cid));
        
        PracaDAO pdao = (PracaDAO) AFactoryDao.getInstance(PracaDAO.class);
        List<Praca> pracaA = pdao.obterTodos();
        List<PracaMeioPagamento> listaPracasMPs = new ArrayList<PracaMeioPagamento>();
        for (Praca pc : pracaA) {
            if (pc != null) {
                if (request.getParameter(ativo + pc.getId()) != null) {
                    PracaMeioPagamento pmp = new PracaMeioPagamento();
                    pmp.setCodPracaLocal(request.getParameter(codPraca + pc.getId()));
                    pmp.setMeioPagto(meioP);
                    pmp.setPraca(pc);
                    listaPracasMPs.add(pmp);
                }
            }
        }
        for(PracaMeioPagamento mp : listaPracasMPs){
            mpdao.salvar(mp);
        }
        mpdao.commit();
        mpdao.close();
        /*
        MeioPagamento mp = mdao.obterAntigo(Integer.parseInt(request.getParameter("id")));
        for (PracaMeioPagamento mpm : mp.getPracaMeiosPagamentos()) {
            if (mpm != null) {
                boolean enc = false;
                for (PracaMeioPagamento mp2 : listaPracasMPs) {
                    if (mp2.getPraca().getId() == mpm.getPraca().getId() && mp2.getMeioPagto().getId() == meioP.getId()) {
                        enc = true;
                    }
                }
                if (!enc) {
                    PracaMeioPagamentoDAO mpdao = (PracaMeioPagamentoDAO) AFactoryDao.getInstance(PracaMeioPagamentoDAO.class);
                    mpdao.Deletar(mpm);
                }
            }
        }
        mdao.close();
        pdao.close();
        meioP.setPracaMeiosPagamentos(listaPracasMPs);
        this.mdao.salvar(meioP);
        mdao.commit();
        mdao.close();*/
    }

    private void tratarDependencias(HttpServletRequest request) {
        String id = request.getParameter("id");
        String cid = request.getParameter("cid");
        if (cid != null && !cid.equals("") && !cid.equals("undefined")) {
            conc = cdao.obter(Integer.parseInt(cid));
        }
        if (id != null && !id.equals("") && !id.equals("undefined")) {
            meioP = mdao.obter(Integer.parseInt(id));
            if (meioP.isConfigContato()) {
                ConfigContato ct = new ConfigContato();
                ct.setEmail(request.getParameter("email"));
                ct.setId(1);
                ct.setNome(request.getParameter("nome"));
                ct.setTelefone(request.getParameter("telefone"));
                meioP.setContato(ct);
                mdao.salvar(meioP);
                mdao.commit();
            }
            if (meioP.isConfigEquipamento()) {
                ConfigEquipamento ce = new ConfigEquipamento();
                ce.setMarca(request.getParameter("marca"));
                ce.setModelo(request.getParameter("modelo"));
                meioP.setEquipamento(ce);
                mdao.salvar(meioP);
                mdao.commit();
            }
        }
    }

    public void tratarMPsAtivos(HttpServletRequest request) {
        String cid = request.getParameter("cid");
        if (cid != null && !cid.equals("") && !cid.equals("undefined")) {
            conc = cdao.obter(Integer.parseInt(cid));
            for (MeioPagamento mp : conc.getMeiosPagamento()) {
                if (mp == null) {
                    continue;
                }
                if (request.getParameter("habilitado" + mp.getId()) != null) {
                    mp.setHabilitado(true);
                } else {
                    mp.setHabilitado(false);
                }
            }
            cdao.salvar(conc);
            cdao.commit();
        }
    }
}
