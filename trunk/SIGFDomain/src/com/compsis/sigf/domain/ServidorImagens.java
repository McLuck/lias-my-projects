package com.compsis.sigf.domain;

/**
 * Compsis
 * @author Lucas Israel
 * @see 05/08/2011
 * @version 1.0
 * 
 */
public class ServidorImagens extends Servidor{
    private int estruturaDiretorio;

    /**
     * @return the estruturaDiretorio
     */
    public int getEstruturaDiretorio() {
        return estruturaDiretorio;
    }

    /**
     * @param estruturaDiretorio the estruturaDiretorio to set
     */
    public void setEstruturaDiretorio(int estruturaDiretorio) {
        this.estruturaDiretorio = estruturaDiretorio;
    }
}
