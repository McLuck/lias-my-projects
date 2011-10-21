package com.compsis.sigf.domain;

public class MotivoFechamentoPista extends DomainObject{
	private static final long serialVersionUID = 7593505923365998514L;
	private Concessionaria concessionaria;
	
	public Concessionaria getConcessionaria() {
		return concessionaria;
	}
	public void setConcessionaria(Concessionaria concessionaria) {
		this.concessionaria = concessionaria;
	}
	
	private boolean fimTurno, refeicao, trocaTurno, qtoBanheiro, fechamentoAntecipado, manutencaoPista, ginastica, qre, servicoInterno;

	public boolean isFimTurno() {
		return fimTurno;
	}
	public void setFimTurno(boolean fimTurno) {
		this.fimTurno = fimTurno;
	}
	public boolean isRefeicao() {
		return refeicao;
	}
	public void setRefeicao(boolean refeicao) {
		this.refeicao = refeicao;
	}
	public boolean isTrocaTurno() {
		return trocaTurno;
	}
	public void setTrocaTurno(boolean trocaTurno) {
		this.trocaTurno = trocaTurno;
	}
	public boolean isQtoBanheiro() {
		return qtoBanheiro;
	}
	public void setQtoBanheiro(boolean qtoBanheiro) {
		this.qtoBanheiro = qtoBanheiro;
	}
	public boolean isFechamentoAntecipado() {
		return fechamentoAntecipado;
	}
	public void setFechamentoAntecipado(boolean fechamentoAntecipado) {
		this.fechamentoAntecipado = fechamentoAntecipado;
	}
	public boolean isManutencaoPista() {
		return manutencaoPista;
	}
	public void setManutencaoPista(boolean manutencaoPista) {
		this.manutencaoPista = manutencaoPista;
	}
	public boolean isGinastica() {
		return ginastica;
	}
	public void setGinastica(boolean ginastica) {
		this.ginastica = ginastica;
	}
	public boolean isQre() {
		return qre;
	}
	public void setQre(boolean qre) {
		this.qre = qre;
	}
	public boolean isServicoInterno() {
		return servicoInterno;
	}
	public void setServicoInterno(boolean servicoInterno) {
		this.servicoInterno = servicoInterno;
	}
}
