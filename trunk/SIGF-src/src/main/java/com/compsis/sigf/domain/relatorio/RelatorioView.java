package com.compsis.sigf.domain.relatorio;

import com.compsis.sigf.domain.Relatorio;

/**
 *
 * @author Lucas Israel
 */
public class RelatorioView {
    private Relatorio relatorio;
    private boolean ativo;

    /**
     * @return the relatorio
     */
    public Relatorio getRelatorio() {
        return relatorio;
    }

    /**
     * @param relatorio the relatorio to set
     */
    public void setRelatorio(Relatorio relatorio) {
        this.relatorio = relatorio;
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
}
