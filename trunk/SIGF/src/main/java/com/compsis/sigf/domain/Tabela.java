package com.compsis.sigf.domain;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lucas Israel
 */
public class Tabela extends DomainObject implements Replicable, Comparable<Tabela> {
    private static final long serialVersionUID = 1L;
    private String nome;
    private List<Campo> campos;
    private int ordem;
    
    private Versao versao;
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
     * @return the campos
     */
    public List<Campo> getCampos() {
        return campos;
    }

    /**
     * @param campos the campos to set
     */
    public void setCampos(List<Campo> campos) {
        this.campos = campos;
    }

    /**
     * @return the versao
     */
    public Versao getVersao() {
        return versao;
    }

    /**
     * @param versao the versao to set
     */
    public void setVersao(Versao versao) {
        this.versao = versao;
    }

    @Override
    public Replicable replicate(Object o) {
        Tabela t = new Tabela();
        t.setId(null);
        t.setNome(this.getNome());
        t.setVersao((Versao)o);
        t.setOrdem(ordem);
        List<Campo> cps = this.getCampos();
        if(cps!=null){
            List<Campo> cps2 = new ArrayList<Campo>();
            for(Campo c : cps){
                if(c==null)continue;
                cps2.add((Campo)c.replicate(t));
            }
            t.setCampos(cps2);
        }
        return t;
    }

    /**
     * @return the ordem
     */
    public int getOrdem() {
        return ordem;
    }

    /**
     * @param ordem the ordem to set
     */
    public void setOrdem(int ordem) {
        this.ordem = ordem;
    }

    
    @Override
    public int compareTo(Tabela o) {
        if (o != null) {
            return (o.getOrdem() > ordem) ? -1 : o.getOrdem() == ordem ? 0 : 1;
        }
        return -1;
    }
}
