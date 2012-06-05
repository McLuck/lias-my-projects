package com.compsis.sigf.domain;

import com.google.gson.Gson;

/**
 * Compsis
 * @author Lucas Israel
 * @see 05/08/2011
 * @version 1.0
 * 
 */
public class ServidorBD extends Servidor implements Replicable{
    
    private int bd;

    /**
     * @return the bd
     */
    public int getBd() {
        return bd;
    }

    /**
     * @param bd the bd to set
     */
    public void setBd(int bd) {
        this.bd = bd;
    }

    @Override
    public Replicable replicate(Object o) {
        ServidorBD s = new ServidorBD();
        s.setBd(bd);
        s.setEdicao(getEdicao());
        s.setEdicaoOutros(this.getEdicaoOutros());
        s.setId(null);
        s.setIdioma(getIdioma());
        s.setIdomaOutro(getIdomaOutro());
        s.setIp(getIp());
        s.setLinuxDetalhe(getLinuxDetalhe());
        s.setOs(getOs());
        s.setOsDetalhe(getOsDetalhe());
        s.setVersao(getVersao());
        return s;
    }
    
    public String toString(){
		return new Gson().toJson(this);
	}
}
