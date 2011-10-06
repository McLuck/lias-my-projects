package com.compsis.sigf.domain;

/**
 *
 * @author Lucas Israel
 */
public class ConfigAcesso extends DomainObject{
    private int complexidade, qtdMinimaSegura, diaSenhaExpirar, statusOperadorInativo, qtdRegistroSenha, senhaValidade, toleranciaBloqueio, tempoBloqueio;
    public int getTempoBloqueio() {
		return tempoBloqueio;
	}

	public void setTempoBloqueio(int tempoBloqueio) {
		this.tempoBloqueio = tempoBloqueio;
	}

	private boolean senhaExpira;
    private Concessionaria concessionaria;

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
}
