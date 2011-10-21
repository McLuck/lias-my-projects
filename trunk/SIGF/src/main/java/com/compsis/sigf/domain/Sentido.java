package com.compsis.sigf.domain;

public class Sentido extends DomainObject implements Replicable{
	private static final long serialVersionUID = -4538773933895271013L;
	
	private Localizacao localizacao;
	
	public Localizacao getLocalizacao() {
		return localizacao;
	}

	public void setLocalizacao(Localizacao localizacao) {
		this.localizacao = localizacao;
	}

	private String sentido, sigla;

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
}
