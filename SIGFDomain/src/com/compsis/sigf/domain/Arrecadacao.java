package com.compsis.sigf.domain;

import com.google.gson.Gson;

/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class Arrecadacao extends DomainObject implements Replicable{
    private int formaDevTroco, formArrecadador, formSupervisor, formRespPista, formVendCupons, formSangria, qtdMaximaIsentos=900;

    public String toString(){
		return new Gson().toJson(this);
	}
    
    /**
     * @return the formaDevTroco
     */
    public int getFormaDevTroco() {
        return formaDevTroco;
    }

    /**
     * @param formaDevTroco the formaDevTroco to set
     */
    public void setFormaDevTroco(int formaDevTroco) {
        this.formaDevTroco = formaDevTroco;
    }

    /**
     * @return the formArrecadador
     */
    public int getFormArrecadador() {
        return formArrecadador;
    }

    /**
     * @param formArrecadador the formArrecadador to set
     */
    public void setFormArrecadador(int formArrecadador) {
        this.formArrecadador = formArrecadador;
    }

    /**
     * @return the formSupervisor
     */
    public int getFormSupervisor() {
        return formSupervisor;
    }

    /**
     * @param formSupervisor the formSupervisor to set
     */
    public void setFormSupervisor(int formSupervisor) {
        this.formSupervisor = formSupervisor;
    }

    /**
     * @return the formRespPista
     */
    public int getFormRespPista() {
        return formRespPista;
    }

    /**
     * @param formRespPista the formRespPista to set
     */
    public void setFormRespPista(int formRespPista) {
        this.formRespPista = formRespPista;
    }

    /**
     * @return the formVendCupons
     */
    public int getFormVendCupons() {
        return formVendCupons;
    }

    /**
     * @param formVendCupons the formVendCupons to set
     */
    public void setFormVendCupons(int formVendCupons) {
        this.formVendCupons = formVendCupons;
    }

    /**
     * @return the formSangria
     */
    public int getFormSangria() {
        return formSangria;
    }

    /**
     * @param formSangria the formSangria to set
     */
    public void setFormSangria(int formSangria) {
        this.formSangria = formSangria;
    }

    @Override
    public Replicable replicate(Object o) {
        Arrecadacao a = new Arrecadacao();
        a.setId(null);
        a.setFormArrecadador(formArrecadador);
        a.setFormRespPista(formRespPista);
        a.setFormSangria(formSangria);
        a.setFormSupervisor(formSupervisor);
        a.setFormVendCupons(formVendCupons);
        a.setFormaDevTroco(formaDevTroco);
        return a;
    }

	/**
	 * @return the qtdMaximaIsentos
	 */
	public int getQtdMaximaIsentos() {
		return qtdMaximaIsentos;
	}

	/**
	 * @param qtdMaximaIsentos the qtdMaximaIsentos to set
	 */
	public void setQtdMaximaIsentos(int qtdMaximaIsentos) {
		this.qtdMaximaIsentos = qtdMaximaIsentos;
	}
}
