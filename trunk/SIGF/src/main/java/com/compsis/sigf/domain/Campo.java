package com.compsis.sigf.domain;

import javassist.SerialVersionUID;

/**
 *
 * @author Lucas Israel
 */
public class Campo extends DomainObject implements Replicable, Comparable<Campo> {
    
    private static final long serialVersionUID = 2L;
    private String nome, valor;
    
    private Tabela tabela;

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
     * @return the valor
     */
    public String getValor() {
        if(valor!=null && valor.startsWith("'")){
            if(valor.startsWith("''") && !valor.trim().equals("''")){
                valor = valor.trim();
                valor = valor.substring(1, valor.length());
            }
            if(valor.endsWith("''") && !valor.trim().equals("''")){
                valor = valor.trim();
                valor = valor.substring(0, valor.length()-1);
            }
        }
        return valor;
    }

    /**
     * @param valor the valor to set
     */
    public void setValor(Object valor) {
        if(this.valor!=null && this.valor.trim().startsWith("'")){
            this.valor = "'".concat(String.valueOf(valor)).concat("'");
        }else{
            this.valor = String.valueOf(valor);
        }
    }

    /**
     * @return the tabela
     */
    public Tabela getTabela() {
        return tabela;
    }

    /**
     * @param tabela the tabela to set
     */
    public void setTabela(Tabela tabela) {
        this.tabela = tabela;
    }

    @Override
    public Replicable replicate(Object o) {
        Campo c = new Campo();
        c.setId(null);
        c.setNome(this.getNome());
        c.setTabela((Tabela)o);
        c.setValor(this.getValor());
        return c;
    }

    @Override
    public int compareTo(Campo o) {
        return o.getId()==this.getId()?0:(o.getId()>this.getId())?-1:1;
    }
}
