package com.compsis.sigf.domain;

/**
 *
 * @author Lucas Israel
 */
public class Insert extends DomainObject {
    private String tabela;
    private String descricao;
    private Versao versao;
    private Tabela tbAux;
    
    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
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

    /**
     * @return the tabela
     */
    public String getTabela() {
        return tabela;
    }

    /**
     * @param tabela the tabela to set
     */
    public void setTabela(String tabela) {
        this.tabela = tabela;
    }

    /**
     * ATENCAO: NAO PERSISTENTE
     * @return the tbAux
     */
    public Tabela getTbAux() {
        return tbAux;
    }

    /**
     * ATENCAO: NAO PERSISTENTE
     * @param tbAux the tbAux to set
     */
    public void setTbAux(Tabela tbAux) {
        this.tbAux = tbAux;
    }
    
}
