package com.compsis.sigf.domain;

/**
 *
 * @author Lucas Israel
 */
public class FuncionalidadeConcessionaria extends DomainObject implements Replicable{
    private Concessionaria concessionaria;
    private Funcionalidade funcionalidade;

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
     * @return the funcionalidade
     */
    public Funcionalidade getFuncionalidade() {
        return funcionalidade;
    }

    /**
     * @param funcionalidade the funcionalidade to set
     */
    public void setFuncionalidade(Funcionalidade funcionalidade) {
        this.funcionalidade = funcionalidade;
    }

    @Override
    public Replicable replicate(Object o) {
        FuncionalidadeConcessionaria fc = new FuncionalidadeConcessionaria();
        fc.setConcessionaria((Concessionaria)o);
        fc.setFuncionalidade((Funcionalidade)funcionalidade.replicate(null));
        return fc;
    }
}
