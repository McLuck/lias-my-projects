
package com.compsis.sigf.domain;

import java.util.ArrayList;
import java.util.List;

/**
 * Compsis
 * @author Lucas Israel
 * @see 05/08/2011
 * @version 1.0
 * 
 */
public class Pista extends DomainObject implements Replicable{
    private Praca praca;
    private int idLocalizacao, tipo, numeroPista;
    private String nomeMaquina, ipMaquina, sentido, descricao;
    
    public String getTipoStr(){
        return BASE.TIPOS.GET_TIPO_PISTA(tipo);
    }
    
    @Override
    public int hashCode(){
        if(nomeMaquina!=null && sentido!=null){
            return (getId()+sentido.hashCode()+idLocalizacao+tipo)*nomeMaquina.hashCode() / 256;
        }else if(ipMaquina!=null && sentido!=null){
            return (getId()+sentido.hashCode()+idLocalizacao+tipo)*ipMaquina.hashCode() / 256;
        }else if(nomeMaquina!= null && ipMaquina!=null){
            return (getId()+nomeMaquina.hashCode()+ipMaquina.hashCode()+idLocalizacao+tipo)*nomeMaquina.hashCode() / 256;
        }else if(nomeMaquina!=null){
            return (getId()+idLocalizacao+tipo)*nomeMaquina.hashCode() / 256;
        }else if(ipMaquina!=null){
            return (getId()+idLocalizacao+tipo)*ipMaquina.hashCode() / 256;
        }
        return (getId()+idLocalizacao+tipo);
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Pista other = (Pista) obj;
        if (this.getId() != other.getId()) {
            return false;
        }
        if (this.sentido != other.sentido) {
            return false;
        }
        if (this.idLocalizacao != other.idLocalizacao) {
            return false;
        }
        if (this.tipo != other.tipo) {
            return false;
        }
        if ((this.nomeMaquina == null) ? (other.nomeMaquina != null) : !this.nomeMaquina.equals(other.nomeMaquina)) {
            return false;
        }
        if ((this.ipMaquina == null) ? (other.ipMaquina != null) : !this.ipMaquina.equals(other.ipMaquina)) {
            return false;
        }
        return true;
    }

    /**
     * @return the sentido
     */
    public String getSentido() {
        return sentido;
    }

    /**
     * @param sentido the sentido to set
     */
    public void setSentido(String sentido) {
        this.sentido = sentido;
    }

    /**
     * @return the idLocalizacao
     */
    public int getIdLocalizacao() {
        return idLocalizacao;
    }

    /**
     * @param idLocalizacao the idLocalizacao to set
     */
    public void setIdLocalizacao(int idLocalizacao) {
        this.idLocalizacao = idLocalizacao;
    }

    /**
     * @return the tipo
     */
    public int getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the nomeMaquina
     */
    public String getNomeMaquina() {
        return nomeMaquina;
    }

    /**
     * @param nomeMaquina the nomeMaquina to set
     */
    public void setNomeMaquina(String nomeMaquina) {
        this.nomeMaquina = nomeMaquina;
    }

    /**
     * @return the ipMaquina
     */
    public String getIpMaquina() {
        return ipMaquina;
    }

    /**
     * @param ipMaquina the ipMaquina to set
     */
    public void setIpMaquina(String ipMaquina) {
        this.ipMaquina = ipMaquina;
    }

    /**
     * @return the praca
     */
    public Praca getPraca() {
        return praca;
    }

    /**
     * @param praca the praca to set
     */
    public void setPraca(Praca praca) {
        this.praca = praca;
    }

    @Override
    public Replicable replicate(Object o) {
        Pista p = new Pista();
        p.setId(null);
        p.setIdLocalizacao(idLocalizacao);
        p.setIpMaquina(ipMaquina);
        p.setNomeMaquina(nomeMaquina);
        p.setPraca((Praca)o);
        p.setSentido(sentido);
        p.setTipo(tipo);
        return p;
    }

    /**
     * @return the numeroPista
     */
    public int getNumeroPista() {
        return numeroPista;
    }

    /**
     * @param numeroPista the numeroPista to set
     */
    public void setNumeroPista(int numeroPista) {
        this.numeroPista = numeroPista;
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
}
