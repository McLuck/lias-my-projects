package com.compsis.sigf.domain;

import java.io.Serializable;
import java.util.List;

import com.google.gson.Gson;

/**
 *
 * @author Lucas Israel
 */
public class FuncionalidadeAcesso extends DomainObject implements Replicable, Serializable{
    private int idFuncionalidade;
    private String acesso, acessoMetodo;
    private int nivelPorMetodo;


    public String toString(){
		return new Gson().toJson(this, FuncionalidadeAcesso.class);
	}

    /**
     * @return the acesso
     */
    public String getAcesso() {
        return acesso;
    }

    /**
     * @param acesso the acesso to set
     */
    public void setAcesso(String acesso) {
        this.acesso = acesso;
    }

    /**
     * @return the acessoMetodo
     */
    public String getAcessoMetodo() {
        return acessoMetodo;
    }

    /**
     * @param acessoMetodo the acessoMetodo to set
     */
    public void setAcessoMetodo(String acessoMetodo) {
        this.acessoMetodo = acessoMetodo;
    }

    /**
     * @return the nivelPorMetodo
     */
    public int getNivelPorMetodo() {
        return nivelPorMetodo;
    }

    /**
     * @param nivelPorMetodo the nivelPorMetodo to set
     */
    public void setNivelPorMetodo(int nivelPorMetodo) {
        this.nivelPorMetodo = nivelPorMetodo;
    }

    @Override
    public Replicable replicate(Object o) {
        FuncionalidadeAcesso f = new FuncionalidadeAcesso();
        f.setId(null);
        f.setAcesso(acesso);
        f.setAcessoMetodo(acessoMetodo);
        f.setNivelPorMetodo(nivelPorMetodo);
        f.setIdFuncionalidade(idFuncionalidade);
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
