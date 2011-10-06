/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.compsis.sigf.domain;

/**
 *
 * @author lamancio
 */
public class RelatorioConcessionaria extends DomainObject implements Replicable{
    private Relatorio relatorio;
    private Concessionaria concessionaria;
    
    @Override
    public Replicable replicate(Object o) {
        RelatorioConcessionaria r = new RelatorioConcessionaria();
        r.setConcessionaria((Concessionaria) o);
        r.setRelatorio((Relatorio)relatorio.replicate(null));
        return r;
    }

    /**
     * @return the concessionaria
     */
    public Concessionaria getConcessionaria() {
        return concessionaria;
    }

    /**
     * @param concessionaria the concessionaria to set
     */
    public void setConcessionaria(Concessionaria concessionaria) {
        this.concessionaria = concessionaria;
    }

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
}
