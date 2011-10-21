package com.compsis.sigf.domain;

import java.util.ArrayList;
import java.util.List;

public class Localizacao extends DomainObject implements Replicable{
	private static final long serialVersionUID = -3899857178911756673L;
	
	
	private int numero;
	private String descricao;
	/*private String sentido;*/
	private List<Pista> pistas;
	private List<Sentido> sentidos;
	
	public int getNumeroSentido(String sigla){
		sigla = sigla.trim().toUpperCase();
		for(int i=0;i<getSentidos().size();i++){
			if(getSentidos().get(i)!=null && getSentidos().get(i).getSigla().toUpperCase().trim().equals(sigla)){
				return i;
			}
		}
		return -1;
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
	private Praca praca;
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
}
