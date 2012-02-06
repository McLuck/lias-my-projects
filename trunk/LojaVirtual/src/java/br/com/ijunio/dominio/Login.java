/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ijunio.dominio;

/**
 *
 * @author Junio
 */
public class Login {
 private String email;
 private String senha;
 private int idCliente;
 
 // get and set
 
 public String getEmailLogin(){
     return email;
 }
 public void setEmailLogin(String email){
     this.email = email;
 }
 
 public String getSenha(){
     return senha;
 }
 
 public void setSenha(String senha){
     this.senha = senha;
 }
 
 public int getIdCliente(){
     return idCliente; 
 }
 
 public void setIdCliente(int idCliente){
     this.idCliente = idCliente;
 }
}