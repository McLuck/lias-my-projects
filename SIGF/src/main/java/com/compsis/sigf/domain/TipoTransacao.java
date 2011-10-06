package com.compsis.sigf.domain;

/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class TipoTransacao extends DomainObject implements Replicable{
    private String nome;
    private boolean adquireImagem;
    private ConfiguracaoImagem configImagem;
    public String getAdqrImagStr(){
        return (adquireImagem)?"checked='true'":"";
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
     * @return the adquireImagem
     */
    public boolean isAdquireImagem() {
        return adquireImagem;
    }

    /**
     * @param adquireImagem the adquireImagem to set
     */
    public void setAdquireImagem(boolean adquireImagem) {
        this.adquireImagem = adquireImagem;
    }

    

    @Override
    public Replicable replicate(Object o) {
        TipoTransacao t = new TipoTransacao();
        t.setAdquireImagem(adquireImagem);
        t.setConfigImagem((ConfiguracaoImagem)o);
        t.setId(null);
        t.setNome(nome);
        return t;
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
