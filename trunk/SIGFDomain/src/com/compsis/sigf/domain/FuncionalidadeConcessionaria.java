package com.compsis.sigf.domain;

import java.io.Serializable;

import com.google.gson.Gson;

/**
 *
 * @author Lucas Israel
 */
public class FuncionalidadeConcessionaria extends DomainObject implements Replicable, Serializable{
    private transient Concessionaria concessionaria;
    private Funcionalidade funcionalidade;
    
    public String toString(){
		return new Gson().toJson(this, FuncionalidadeConcessionaria.class);
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
