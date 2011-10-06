package com.compsis.sigf.domain;
/**
 * Compsis
 * @author Lucas Israel
 * @see 11/08/2011
 * @version 1.0
 * 
 */
public class AntenaPista extends DomainObject implements Replicable{
    private String fabricante;
    private String modelo;
    private int interfaceAcesso;
    private ConfiguracaoPraca configuracaoPraca;
    
    public String getInterfaceStr(){
        return (interfaceAcesso==1)?"Serial":"USB";
    }
    /**
     * @return the fabricante
     */
    public String getFabricante() {
        return fabricante;
    }

    /**
     * @param fabricante the fabricante to set
     */
    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
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
     * @return the interfaceAcesso
     */
    public int getInterfaceAcesso() {
        return interfaceAcesso;
    }

    /**
     * @param interfaceAcesso the interfaceAcesso to set
     */
    public void setInterfaceAcesso(int interfaceAcesso) {
        this.interfaceAcesso = interfaceAcesso;
    }

    /**
     * @return the configuracaoPraca
     */
    public ConfiguracaoPraca getConfiguracaoPraca() {
        return configuracaoPraca;
    }

    /**
     * @param configuracaoPraca the configuracaoPraca to set
     */
    public void setConfiguracaoPraca(ConfiguracaoPraca configuracaoPraca) {
        this.configuracaoPraca = configuracaoPraca;
    }

    @Override
    public Replicable replicate(Object o) {
        AntenaPista an = new AntenaPista();
        an.setId(null);
        an.setConfiguracaoPraca((ConfiguracaoPraca)o);
        an.setInterfaceAcesso(interfaceAcesso);
        an.setModelo(modelo);
        an.setFabricante(fabricante);
        return an;
    }
}
