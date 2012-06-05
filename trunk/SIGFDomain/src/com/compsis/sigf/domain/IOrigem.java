package com.compsis.sigf.domain;

public interface IOrigem {
	public Long getIdOrigem();
	public Integer getTipoOrigem();
	public String getDescricao();
	public Integer getPracaOrigem();
	public Integer getLocalizacaoOrigem();
	public Integer getPistaOrigem();
	public Integer getSentidoOrigem();
	public Integer getNumeroCabine();
	public Long getIdOrigemPai();
	public Integer getTipoPistaArrecadacao();
	public Integer getFlagOperacao();
	public Integer getAtiva();
}
