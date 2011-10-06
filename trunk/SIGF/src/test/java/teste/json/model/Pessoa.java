package teste.json.model;

import java.io.Serializable;
import java.util.List;


public class Pessoa implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4837011541965319574L;
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public List<Funcao> getFuncoes() {
		return funcoes;
	}
	public void setFuncoes(List<Funcao> funcoes) {
		this.funcoes = funcoes;
	}
	private String nome;
	private List<Funcao> funcoes;
}
