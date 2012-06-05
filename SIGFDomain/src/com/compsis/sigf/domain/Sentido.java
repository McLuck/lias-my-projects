package com.compsis.sigf.domain;

import java.util.List;

import com.google.gson.Gson;

import br.com.compsis.sigf.util.IDUtils;

public class Sentido extends DomainObject implements Replicable, IOrigem{
	private static final long serialVersionUID = -4538773933895271013L;
	
	private transient Localizacao localizacao;
	private String sentido, sigla;
	private int numero;
	private List<Sentido> sentidos;
	
	public String toString(){
		Sentido s = (Sentido)replicate(null);
		s.setLocalizacao(null);
		return new Gson().toJson(s, Sentido.class);
	}
	
	public Localizacao getLocalizacao() {
		return localizacao;
	}

	public void setLocalizacao(Localizacao localizacao) {
		this.localizacao = localizacao;
	}

	/**
	 * @return the numero
	 */
	public int getNumero() {
		return numero;
	}

	/**
	 * @param numero the numero to set
	 */
	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getSentido() {
		return sentido;
	}

	public void setSentido(String sentido) {
		this.sentido = sentido;
	}

	public String getSigla() {
		return sigla;
	}

	public void setSigla(String sigla) {
		this.sigla = sigla;
	}

	@Override
	public Replicable replicate(Object o) {
		Sentido s = new Sentido();
		s.setId(null);
		s.setLocalizacao((Localizacao)o);
		s.setSentido(sentido);
		s.setSigla(sigla);
		return s;
	}

	@Override
	public Long getIdOrigem() {
		String idorigem = IDUtils.IdOrigem.getIdOrigem(this);
		return idorigem!=null?Long.parseLong(idorigem):null;
	}

	@Override
	public Integer getTipoOrigem() {
		return Integer.valueOf(6);
	}

	@Override
	public String getDescricao() {
		return this.getSentido();
	}

	@Override
	public Integer getPracaOrigem() {
		return Integer.valueOf(this.getLocalizacao().getPraca().getNumeroPraca());
	}

	@Override
	public Integer getLocalizacaoOrigem() {
		return Integer.valueOf(this.getLocalizacao().getNumero());
	}

	@Override
	public Integer getPistaOrigem() {
		return null;
	}

	@Override
	public Integer getSentidoOrigem() {
		return Integer.valueOf(this.getNumero());
	}

	@Override
	public Integer getNumeroCabine() {
		return null;
	}

	@Override
	public Long getIdOrigemPai() {
		String idorigem = IDUtils.IdOrigem.getIdOrigem(this.getLocalizacao());
		return idorigem!=null?Long.parseLong(idorigem):null;
	}

	@Override
	public Integer getTipoPistaArrecadacao() {
		return null;
	}

	@Override
	public Integer getFlagOperacao() {
		return null;
	}

	@Override
	public Integer getAtiva() {
		return Integer.valueOf(1);
	}

	/**
	 * @return the sentidos
	 */
	public List<Sentido> getSentidos() {
		return sentidos;
	}

	/**
	 * @param sentidos the sentidos to set
	 */
	public void setSentidos(List<Sentido> sentidos) {
		this.sentidos = sentidos;
	}
}
