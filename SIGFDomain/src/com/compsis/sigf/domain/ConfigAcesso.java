package com.compsis.sigf.domain;

import java.io.Serializable;

import com.google.gson.Gson;

/**
 *
 * @author Lucas Israel
 */
public class ConfigAcesso extends DomainObject implements Serializable, Replicable{
    private int complexidade, qtdMinimaSegura, diaSenhaExpirar, statusOperadorInativo, qtdRegistroSenha, senhaValidade, toleranciaBloqueio, tempoBloqueio;
    public int getTempoBloqueio() {
		return tempoBloqueio;
	}

	public void setTempoBloqueio(int tempoBloqueio) {
		this.tempoBloqueio = tempoBloqueio;
	}

	private boolean senhaExpira;
    private transient Concessionaria concessionaria;

    public String toString(){
		return new Gson().toJson(this, ConfigAcesso.class);
	}
    
    /**
     * @return the complexidade
     */
    public int getComplexidade() {
        return complexidade;
    }

    /**
     * @param complexidade the complexidade to set
     */
    public void setComplexidade(int complexidade) {
        this.complexidade = complexidade;
    }

    /**
     * @return the qtdMinimaSegura
     */
    public int getQtdMinimaSegura() {
        return qtdMinimaSegura;
    }

    /**
     * @param qtdMinimaSegura the qtdMinimaSegura to set
     */
    public void setQtdMinimaSegura(int qtdMinimaSegura) {
        this.qtdMinimaSegura = qtdMinimaSegura;
    }

    /**
     * @return the diaSenhaExpirar
     */
    public int getDiaSenhaExpirar() {
        return diaSenhaExpirar;
    }

    /**
     * @param diaSenhaExpirar the diaSenhaExpirar to set
     */
    public void setDiaSenhaExpirar(int diaSenhaExpirar) {
        this.diaSenhaExpirar = diaSenhaExpirar;
    }

    /**
     * @return the statusOperadorInativo
     */
    public int getStatusOperadorInativo() {
        return statusOperadorInativo;
    }

    /**
     * @param statusOperadorInativo the statusOperadorInativo to set
     */
    public void setStatusOperadorInativo(int statusOperadorInativo) {
        this.statusOperadorInativo = statusOperadorInativo;
    }

    /**
     * @return the senhaExpira
     */
    public boolean isSenhaExpira() {
        return senhaExpira;
    }

    /**
     * @param senhaExpira the senhaExpira to set
     */
    public void setSenhaExpira(boolean senhaExpira) {
        this.senhaExpira = senhaExpira;
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

    /**
     * @return the qtdRegistroSenha
     */
    public int getQtdRegistroSenha() {
        return qtdRegistroSenha;
    }

    /**
     * @param qtdRegistroSenha the qtdRegistroSenha to set
     */
    public void setQtdRegistroSenha(int qtdRegistroSenha) {
        this.qtdRegistroSenha = qtdRegistroSenha;
    }

    /**
     * @return the senhaValidade
     */
    public int getSenhaValidade() {
        return senhaValidade;
    }

    /**
     * @param senhaValidade the senhaValidade to set
     */
    public void setSenhaValidade(int senhaValidade) {
        this.senhaValidade = senhaValidade;
    }

    /**
     * @return the toleranciaBloqueio
     */
    public int getToleranciaBloqueio() {
        return toleranciaBloqueio;
    }

    /**
     * @param toleranciaBloqueio the toleranciaBloqueio to set
     */
    public void setToleranciaBloqueio(int toleranciaBloqueio) {
        this.toleranciaBloqueio = toleranciaBloqueio;
    }

	@Override
	public Replicable replicate(Object o) {
		ConfigAcesso conf = new ConfigAcesso();
		conf.setComplexidade(complexidade);
		conf.setConcessionaria((Concessionaria)o);
		conf.setDiaSenhaExpirar(diaSenhaExpirar);
		conf.setId(null);
		conf.setQtdMinimaSegura(qtdMinimaSegura);
		conf.setQtdRegistroSenha(qtdRegistroSenha);
		conf.setSenhaExpira(senhaExpira);
		conf.setSenhaValidade(senhaValidade);
		conf.setStatusOperadorInativo(statusOperadorInativo);
		conf.setStatusOperadorInativo(statusOperadorInativo);
		conf.setTempoBloqueio(tempoBloqueio);
		conf.setToleranciaBloqueio(toleranciaBloqueio);
		
		return conf;
	}
}
