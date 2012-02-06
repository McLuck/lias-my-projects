package br.com.ijunio.dominio;

import java.util.Collection;

public class Permissao {
	private int idPermissao;
	private String descricao;
	private Collection<Cliente> cliente;

    /**
     * @return the idPermissao
     */
    public int getIdPermissao() {
        return idPermissao;
    }

    /**
     * @param idPermissao the idPermissao to set
     */
    public void setIdPermissao(int idPermissao) {
        this.idPermissao = idPermissao;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * @return the cliente
     */
    public Collection<Cliente> getCliente() {
        return cliente;
    }

    /**
     * @param cliente the cliente to set
     */
    public void setCliente(Collection<Cliente> cliente) {
        this.cliente = cliente;
    }
	 
}
 
