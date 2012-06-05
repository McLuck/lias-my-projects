/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.compsis.sigf.domain;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lamancio
 */
public class Versao extends DomainObject implements Replicable{
    private static final long serialVersionUID = 3L;
    private String nome;
    private int versao;
    private List<Tabela> tabelas;
    private List<Insert> inserts;

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the versao
     */
    public int getVersao() {
        return versao;
    }

    /**
     * @param versao the versao to set
     */
    public void setVersao(int versao) {
        this.versao = versao;
    }

    /**
     * @return the tabelas
     */
    public List<Tabela> getTabelas() {
        return tabelas;
    }

    /**
     * @param tabelas the tabelas to set
     */
    public void setTabelas(List<Tabela> tabelas) {
        this.tabelas = tabelas;
    }

    @Override
    public Replicable replicate(Object o) {
        Versao v = new Versao();
        v.setId(null);
        v.setNome(this.getNome());
        v.setVersao(this.getVersao());
        List<Tabela> tbs = getTabelas();
        if(tbs != null){
            List<Tabela> tls = new ArrayList<Tabela>();
            for(Tabela t : tbs){
                if(t==null)continue;
                tls.add((Tabela)t.replicate(v));
            }
            v.setTabelas(tls);
        }
        return v;
    }

    /**
     * @return the inserts
     */
    public List<Insert> getInserts() {
        return inserts;
    }

    /**
     * @param inserts the inserts to set
     */
    public void setInserts(List<Insert> inserts) {
        this.inserts = inserts;
    }

}
