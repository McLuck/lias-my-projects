
package com.compsis.sigf.domain;

/**
 * Compsis
 * @author Lucas Israel
 * @see 05/08/2011
 * @version 1.0
 * 
 */
public abstract class Servidor extends DomainObject{
    private int os;
    private String versao, ip;
    private int idioma;
    private int edicao;
    private String osDetalhe, idomaOutro, edicaoOutros, linuxDetalhe;
    
    /**
     * @return the os
     */
    public int getOs() {
        return os;
    }

    /**
     * @param os the os to set
     */
    public void setOs(int os) {
        this.os = os;
    }

    /**
     * @return the idioma
     */
    public int getIdioma() {
        return idioma;
    }

    /**
     * @param idioma the idioma to set
     */
    public void setIdioma(int idioma) {
        this.idioma = idioma;
    }

    /**
     * @return the edicao
     */
    public int getEdicao() {
        return edicao;
    }

    /**
     * @param edicao the edicao to set
     */
    public void setEdicao(int edicao) {
        this.edicao = edicao;
    }

    /**
     * @return the osDetalhe
     */
    public String getOsDetalhe() {
        return osDetalhe;
    }

    /**
     * @param osDetalhe the osDetalhe to set
     */
    public void setOsDetalhe(String osDetalhe) {
        this.osDetalhe = osDetalhe;
    }

    /**
     * @return the idomaOutro
     */
    public String getIdomaOutro() {
        return idomaOutro;
    }

    /**
     * @param idomaOutro the idomaOutro to set
     */
    public void setIdomaOutro(String idomaOutro) {
        this.idomaOutro = idomaOutro;
    }

    /**
     * @return the edicaoOutros
     */
    public String getEdicaoOutros() {
        return edicaoOutros;
    }

    /**
     * @param edicaoOutros the edicaoOutros to set
     */
    public void setEdicaoOutros(String edicaoOutros) {
        this.edicaoOutros = edicaoOutros;
    }

    /**
     * @return the versao
     */
    public String getVersao() {
        return versao;
    }

    /**
     * @param versao the versao to set
     */
    public void setVersao(String versao) {
        this.versao = versao;
    }

    /**
     * @return the linuxDetalhe
     */
    public String getLinuxDetalhe() {
        return linuxDetalhe;
    }

    /**
     * @param linuxDetalhe the linuxDetalhe to set
     */
    public void setLinuxDetalhe(String linuxDetalhe) {
        this.linuxDetalhe = linuxDetalhe;
    }

    /**
     * @return the ip
     */
    public String getIp() {
        return ip;
    }

    /**
     * @param ip the ip to set
     */
    public void setIp(String ip) {
        this.ip = ip;
    }
}
