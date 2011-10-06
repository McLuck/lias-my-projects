package teste.json.model;

import java.io.Serializable;

public class Funcao implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8191046362388833325L;
	private int id;
	private String nome;
	private Pessoa pessoa;
	public Pessoa getPessoa() {
		return pessoa;
	}
	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
		pessoa.getFuncoes().add(this);
	}
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
}
