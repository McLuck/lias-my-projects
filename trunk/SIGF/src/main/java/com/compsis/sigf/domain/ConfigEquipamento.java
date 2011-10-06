package com.compsis.sigf.domain;

/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class ConfigEquipamento extends DomainObject implements Replicable{
    private String marca, modelo;

    /**
     * @return the marca
     */
    public String getMarca() {
        return marca;
    }

    /**
     * @param marca the marca to set
     */
    public void setMarca(String marca) {
        this.marca = marca;
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

    @Override
    public Replicable replicate(Object o) {
        ConfigEquipamento ce = new ConfigEquipamento();
        ce.setId(null);ce.setMarca(marca);
        ce.setModelo(modelo);
        return ce;
    }
}
