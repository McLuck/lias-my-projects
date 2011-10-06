package com.compsis.sigf.domain;

/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class ConfigContato extends DomainObject implements Replicable{
    private String nome, email, telefone;

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the telefone
     */
    public String getTelefone() {
        return telefone;
    }

    /**
     * @param telefone the telefone to set
     */
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    @Override
    public Replicable replicate(Object o) {
        ConfigContato ct = new ConfigContato();
        ct.setId(null);
        ct.setEmail(email);
        ct.setNome(nome);
        ct.setTelefone(telefone);
        return ct;
    }
}
