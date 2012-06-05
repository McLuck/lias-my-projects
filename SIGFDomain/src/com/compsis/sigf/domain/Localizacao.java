package com.compsis.sigf.domain;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import br.com.compsis.sigf.util.IDUtils;

public class Localizacao extends DomainObject implements Replicable, IOrigem{
	private static final long serialVersionUID = -3899857178911756673L;
	private transient Praca praca;
	
	private int numero;
	private String descricao;
	/*private String sentido;*/
	private List<Pista> pistas;
	private List<Sentido> sentidos;
	
	public String toString(){
		Localizacao l = (Localizacao)replicate(praca);
		l.setPraca(null);
		return new Gson().toJson(l, Localizacao.class);
	}
	
	public int getNumeroSentido(String sigla){
		sigla = sigla.trim().toUpperCase();
		for(int i=0;i<getSentidos().size();i++){
			if(getSentidos().get(i)!=null && getSentidos().get(i).getSigla().toUpperCase().trim().equals(sigla)){
				return i;
			}
		}
		return -1;
	}
	
	public String getSiglas(){
		StringBuffer sb = new StringBuffer();
		boolean first = true;
		if(sentidos!=null && !sentidos.isEmpty()){
			
			for(Sentido s : getSentidos()){
				if(s !=null){
					if(first){
						first=false;
					}else{
						sb.append(", ");
					}
					sb.append(s.getSigla());
				}
			}
		}
		
		return sb.toString();
	}
	public List<Sentido> getSentidos() {
		return sentidos;
	}
	public void setSentidos(List<Sentido> sentidos) {
		this.sentidos = sentidos;
	}
	public List<Pista> getPistas() {
		return pistas;
	}
	public void setPistas(List<Pista> pistas) {
		this.pistas = pistas;
	}
	/*public String getSentido() {
		return sentido;
	}
	public void setSentido(String sentido) {
		this.sentido = sentido;
	}*/
	public int getNumero() {
		return numero;
	}
	public void setNumero(int numero) {
		this.numero = numero;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Praca getPraca() {
		return praca;
	}
	public void setPraca(Praca praca) {
		this.praca = praca;
	}
	@Override
	public Replicable replicate(Object o) {
		com.compsis.sigf.domain.Localizacao l = new Localizacao();
		l.setId(null);
		l.setDescricao(descricao);
		l.setNumero(numero);
		l.setPraca((Praca)o);
		
		if(pistas!=null && !pistas.isEmpty()){
			List<Pista> aux = new ArrayList<Pista>();
			for(Pista pt : pistas){
				aux.add((Pista)pt.replicate(l));
			}
			l.setPistas(aux);
		}
		l.setSentidos(new ArrayList<Sentido>());
		if(sentidos!=null && !sentidos.isEmpty()){
			for(Sentido s : sentidos){
				if(s !=null){
					l.getSentidos().add((Sentido)s.replicate(l));
				}
			}
		}
		return l;
	}

	@Override
	public Long getIdOrigem() {
		String idorigem = IDUtils.IdOrigem.getIdOrigem(this);
		return idorigem!=null?Long.parseLong(idorigem):null;
	}

	@Override
	public Integer getTipoOrigem() {
		return Integer.valueOf(3);
	}

	@Override
	public Integer getLocalizacaoOrigem() {
		return Integer.valueOf(this.getNumero());
	}

	@Override
	public Integer getPistaOrigem() {
		return null;
	}

	@Override
	public Integer getSentidoOrigem() {
		return null;
	}

	@Override
	public Integer getNumeroCabine() {
		return null;
	}

	@Override
	public Long getIdOrigemPai() {
		String idorigem = IDUtils.IdOrigem.getIdOrigem(this.getPraca());
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

	@Override
	public Integer getPracaOrigem() {
		return Integer.valueOf(this.getPraca().getNumeroPraca());
	}	
}
