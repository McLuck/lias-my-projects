
package com.compsis.sigf.domain;

/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class Categoria extends DomainObject implements Replicable{
    private int ordem;
    private boolean habilitada;
    private int cgmp, tipo, ef, rd, av, rm;
    private String descricao, modelo, descOutroCalculoCatEsp;
    private Concessionaria concessionaria;
    
    public String getTipoStr() {
        return BASE.TIPOS.GET_TIPO_CATEGORIA(tipo);
    }

    public String getHabilitaStr() {
        return (habilitada) ? "Sim" : "Não";
    }

    /**
     * @return the cgmp
     */
    public int getCgmp() {
        return cgmp;
    }

    /**
     * @param cgmp the cgmp to set
     */
    public void setCgmp(int cgmp) {
        this.cgmp = cgmp;
    }

    /**
     * @return the tipo
     */
    public int getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

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
     * @return the modelo
     */
    public String getModelo() {
        return modelo;
    }

    /**
     * @param modelo the modelo to set
     */
    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    /**
     * @return the habilitada
     */
    public boolean isHabilitada() {
        return habilitada;
    }

    /**
     * @param habilitada the habilitada to set
     */
    public void setHabilitada(boolean habilitada) {
        this.habilitada = habilitada;
    }

    /**
     * @return the ef
     */
    public int getEf() {
        return ef;
    }

    /**
     * @param ef the ef to set
     */
    public void setEf(int ef) {
        this.ef = ef;
    }

    /**
     * @return the rd
     */
    public int getRd() {
        return rd;
    }

    /**
     * @param rd the rd to set
     */
    public void setRd(int rd) {
        this.rd = rd;
    }

    /**
     * @return the av
     */
    public int getAv() {
        return av;
    }

    /**
     * @param av the av to set
     */
    public void setAv(int av) {
        this.av = av;
    }

    /**
     * @return the rm
     */
    public int getRm() {
        return rm;
    }

    /**
     * @param rm the rm to set
     */
    public void setRm(int rm) {
        this.rm = rm;
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

    /**
     * @return the descOutroCalculoCatEsp
     */
    public String getDescOutroCalculoCatEsp() {
        return descOutroCalculoCatEsp;
    }

    /**
     * @param descOutroCalculoCatEsp the descOutroCalculoCatEsp to set
     */
    public void setDescOutroCalculoCatEsp(String descOutroCalculoCatEsp) {
        this.descOutroCalculoCatEsp = descOutroCalculoCatEsp;
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

    @Override
    public Replicable replicate(Object o) {
        Categoria c = new Categoria();
        c.setAv(av);
        c.setCgmp(cgmp);
        c.setConcessionaria((Concessionaria)o);
        c.setDescOutroCalculoCatEsp(descOutroCalculoCatEsp);
        c.setDescOutroCalculoCatEsp(descOutroCalculoCatEsp);
        c.setDescricao(descricao);
        c.setEf(ef);
        c.setHabilitada(habilitada);
        c.setId(null);
        c.setModelo(modelo);
        c.setOrdem(ordem);
        c.setRd(rd);
        c.setRm(rm);
        c.setTipo(tipo);
        return c;
    }
}
