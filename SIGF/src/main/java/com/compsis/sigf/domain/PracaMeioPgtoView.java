package com.compsis.sigf.domain;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.PracaMeioPagamentoDAO;

/**
 *
 * @author Lucas Israel
 */
public class PracaMeioPgtoView {
    public PracaMeioPgtoView(MeioPagamento mp, Praca pc){
        this.meioPagamento = mp;
        this.praca = pc;
        PracaMeioPagamentoDAO pmDAO = (PracaMeioPagamentoDAO) AFactoryDao.getInstance(PracaMeioPagamentoDAO.class);
        PracaMeioPagamento pm = pmDAO.getByPraca(pc.getId(), mp.getId());
        ativo = pm!=null;
        if(ativo){
            this.codPracaLocal = pm.getCodPracaLocal();
        }
        pmDAO.close();
        pmDAO.clear();
    }
    private MeioPagamento meioPagamento;
    private String codPracaLocal;
    private Praca praca;
    private boolean ativo;

    /**
     * @return the meioPagamento
     */
    public MeioPagamento getMeioPagamento() {
        return meioPagamento;
    }

    /**
     * @param meioPagamento the meioPagamento to set
     */
    public void setMeioPagamento(MeioPagamento meioPagamento) {
        this.meioPagamento = meioPagamento;
    }

    /**
     * @return the ativo
     */
    public boolean isAtivo() {
        return ativo;
    }

    /**
     * @param ativo the ativo to set
     */
    public void setAtivo(boolean ativo) {
        this.ativo = ativo;
    }

    /**
     * @return the praca
     */
    public Praca getPraca() {
        return praca;
    }

    /**
     * @param praca the praca to set
     */
    public void setPraca(Praca praca) {
        this.praca = praca;
    }

    /**
     * @return the codPracaLocal
     */
    public String getCodPracaLocal() {
        return codPracaLocal;
    }

    /**
     * @param codPracaLocal the codPracaLocal to set
     */
    public void setCodPracaLocal(String codPracaLocal) {
        this.codPracaLocal = codPracaLocal;
    }
    
}
