package com.compsis.sigf.domain;

/**
 *
 * @author Lucas Israel
 */
public class PracaMeioPagamento extends DomainObject implements Replicable{
    private String codPracaLocal;
    private MeioPagamento meioPagto;
    private Praca praca;

    /**
     * @return the meioPagto
     */
    public MeioPagamento getMeioPagto() {
        return meioPagto;
    }

    /**
     * @param meioPagto the meioPagto to set
     */
    public void setMeioPagto(MeioPagamento meioPagto) {
        this.meioPagto = meioPagto;
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

    @Override
    public Replicable replicate(Object o) {
        PracaMeioPagamento pmp = new PracaMeioPagamento();
        pmp.setId(null);
        pmp.setCodPracaLocal(codPracaLocal);
        pmp.setMeioPagto(meioPagto);
        pmp.setPraca((Praca)o);
        return pmp;
    }
}
