/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ijunio.dominio;

/**
 *
 * @author Junio
 */
public class Permissao {
    private int idPermissao;
    private String descricao;
    
    // get and set
    public int getIdPermissao(){
        return idPermissao;
    }
    public void setIdPermissao(int idPermissao){
        this.idPermissao = idPermissao;
    }
    
    public String getDescricao(){
        return descricao;
    }
    public void setDescricao(String descricao){
        this.descricao = descricao;
    }
}