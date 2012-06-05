package com.compsis.sigf.domain;

import java.io.Serializable;

/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class TipoPista extends DomainObject implements Replicable, Serializable{
    private String nome;
    private boolean imgVAS, imgVES, imgVAES, imgOCR, imgVBS;
    private transient ConfiguracaoImagem configImagem;
    
    public String getImgVASStr(){
        return (imgVAS)?"checked='true'":"";
    }
    
    public String getImgVESStr(){
        return (imgVES)?"checked='true'":"";
    }
    
    public String getImgVAESStr(){
        return (imgVAES)?"checked='true'":"";
    }
    
    public String getImgOCRStr(){
        return (imgOCR)?"checked='true'":"";
    }
    
    public String getImgVBSStr(){
        return (imgVBS)?"checked='true'":"";
    }

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
     * @return the imgVAS
     */
    public boolean isImgVAS() {
        return imgVAS;
    }

    /**
     * @param imgVAS the imgVAS to set
     */
    public void setImgVAS(boolean imgVAS) {
        this.imgVAS = imgVAS;
    }

    /**
     * @return the imgVES
     */
    public boolean isImgVES() {
        return imgVES;
    }

    /**
     * @param imgVES the imgVES to set
     */
    public void setImgVES(boolean imgVES) {
        this.imgVES = imgVES;
    }

    /**
     * @return the imgVAES
     */
    public boolean isImgVAES() {
        return imgVAES;
    }

    /**
     * @param imgVAES the imgVAES to set
     */
    public void setImgVAES(boolean imgVAES) {
        this.imgVAES = imgVAES;
    }

    /**
     * @return the imgOCR
     */
    public boolean isImgOCR() {
        return imgOCR;
    }

    /**
     * @param imgOCR the imgOCR to set
     */
    public void setImgOCR(boolean imgOCR) {
        this.imgOCR = imgOCR;
    }

    /**
     * @return the imgVBS
     */
    public boolean isImgVBS() {
        return imgVBS;
    }

    /**
     * @param imgVBS the imgVBS to set
     */
    public void setImgVBS(boolean imgVBS) {
        this.imgVBS = imgVBS;
    }

    @Override
    public Replicable replicate(Object o) {
        TipoPista tp = new TipoPista();
        tp.setConfigImagem((ConfiguracaoImagem)o);
        tp.setId(null);
        tp.setImgOCR(imgOCR);
        tp.setImgVAES(imgVAES);
        tp.setImgVAS(imgVAS);
        tp.setImgVBS(imgVBS);
        tp.setImgVES(imgVES);
        tp.setNome(nome);
        return tp;
    }

    /**
     * @return the configImagem
     */
    public ConfiguracaoImagem getConfigImagem() {
        return configImagem;
    }

    /**
     * @param configImagem the configImagem to set
     */
    public void setConfigImagem(ConfiguracaoImagem configImagem) {
        this.configImagem = configImagem;
    }

}
