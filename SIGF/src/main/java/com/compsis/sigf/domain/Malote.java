package com.compsis.sigf.domain;

import java.util.List;

/**
 * Compsis
 * @author Lucas Israel
 * @see 05/08/2011
 * @version 1.0
 * 
 */
public class Malote extends DomainObject implements Replicable{
    private boolean lacreRepete;
    private String detalheFormatoArquivo, diasSemRepetirLacre;
    private int opcCriacaoMalote, opcRegistroDeposito, opcExibicaoInterface;
    
    /**
     * @return the opcCriacaoMalote
     */
    public int getOpcCriacaoMalote() {
        return opcCriacaoMalote;
    }

    /**
     * @param opcCriacaoMalote the opcCriacaoMalote to set
     */
    public void setOpcCriacaoMalote(int opcCriacaoMalote) {
        this.opcCriacaoMalote = opcCriacaoMalote;
    }

    /**
     * @return the opcRegistroDeposito
     */
    public int getOpcRegistroDeposito() {
        return opcRegistroDeposito;
    }

    /**
     * @param opcRegistroDeposito the opcRegistroDeposito to set
     */
    public void setOpcRegistroDeposito(int opcRegistroDeposito) {
        this.opcRegistroDeposito = opcRegistroDeposito;
    }

    /**
     * @return the opcExibicaoInterface
     */
    public int getOpcExibicaoInterface() {
        return opcExibicaoInterface;
    }

    /**
     * @param opcExibicaoInterface the opcExibicaoInterface to set
     */
    public void setOpcExibicaoInterface(int opcExibicaoInterface) {
        this.opcExibicaoInterface = opcExibicaoInterface;
    }

    /**
     * @return the detalheFormatoArquivo
     */
    public String getDetalheFormatoArquivo() {
        return detalheFormatoArquivo;
    }

    /**
     * @param detalheFormatoArquivo the detalheFormatoArquivo to set
     */
    public void setDetalheFormatoArquivo(String detalheFormatoArquivo) {
        this.detalheFormatoArquivo = detalheFormatoArquivo;
    }

    /**
     * @return the lacreRepete
     */
    public boolean isLacreRepete() {
        return lacreRepete;
    }

    /**
     * @param lacreRepete the lacreRepete to set
     */
    public void setLacreRepete(boolean lacreRepete) {
        this.lacreRepete = lacreRepete;
    }

    /**
     * @return the diasSemRepetirLacre
     */
    public String getDiasSemRepetirLacre() {
        return diasSemRepetirLacre;
    }

    /**
     * @param diasSemRepetirLacre the diasSemRepetirLacre to set
     */
    public void setDiasSemRepetirLacre(String diasSemRepetirLacre) {
        this.diasSemRepetirLacre = diasSemRepetirLacre;
    }

    @Override
    public Replicable replicate(Object o) {
        Malote m = new Malote();
        
        m.setId(null);
        m.setDetalheFormatoArquivo(detalheFormatoArquivo);
        m.setDiasSemRepetirLacre(diasSemRepetirLacre);
        m.setLacreRepete(lacreRepete);
        m.setOpcCriacaoMalote(opcCriacaoMalote);
        m.setOpcExibicaoInterface(opcExibicaoInterface);
        m.setOpcRegistroDeposito(opcRegistroDeposito);
        
        return m;
    }
}
