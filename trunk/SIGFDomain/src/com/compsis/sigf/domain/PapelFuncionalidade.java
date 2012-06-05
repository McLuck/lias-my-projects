package com.compsis.sigf.domain;

import java.io.Serializable;

import com.google.gson.Gson;


/**
 *
 * @author Lucas Israel
 */
public class PapelFuncionalidade extends DomainObject implements Replicable, Serializable{
    private int idFuncionalidade;
    private int idpapel;

    /**
     * @return the idpapel
     */
    public int getIdpapel() {
        return idpapel;
    }
    

    public String toString(){
		return new Gson().toJson(this, PapelFuncionalidade.class);
	}

    /**
     * @param idpapel the idpapel to set
     */
    public void setIdpapel(int idpapel) {
        this.idpapel = idpapel;
    }

    @Override
    public Replicable replicate(Object o) {
        PapelFuncionalidade f  = new PapelFuncionalidade();
        f.setId(null);
        f.setIdFuncionalidade(idFuncionalidade);
        f.setIdpapel(idpapel);
        return f;
    }

    /**
     * @return the idFuncionalidade
     */
    public int getIdFuncionalidade() {
        return idFuncionalidade;
    }

    /**
     * @param idFuncionalidade the idFuncionalidade to set
     */
    public void setIdFuncionalidade(int idFuncionalidade) {
        this.idFuncionalidade = idFuncionalidade;
    }
}
