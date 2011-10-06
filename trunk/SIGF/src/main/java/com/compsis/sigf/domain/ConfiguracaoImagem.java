package com.compsis.sigf.domain;

import java.util.ArrayList;
import java.util.List;

/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class ConfiguracaoImagem extends DomainObject implements Replicable{
    private String ipServer;
    private int estruturaDiretorio, server, qtdAdquirida;
    private boolean concatenaCodigoUrl, ordemExibicaCrescente, transacaoCorrecaoImg;
    
    private List<TipoPista> tipoPista;
    private List<TipoTransacao> tiposTransacoes;
    
    private Concessionaria concessionaria;
    
    public String getConcatenaUrlStr(){
        return (isConcatenaCodigoUrl())?"checked='true'":"";
    }
    public String getOrdemExibCrescStr(){
        return (isOrdemExibicaCrescente())?"checked='true'":"";
    }
    public String getTransCorrImgStr(){
        return (isTransacaoCorrecaoImg())?"checked='true'":"";
    }

    /**
     * @return the tipoPista
     */
    public List<TipoPista> getTipoPista() {
        return tipoPista;
    }

    /**
     * @param tipoPista the tipoPista to set
     */
    public void setTipoPista(List<TipoPista> tipoPista) {
        this.tipoPista = tipoPista;
    }

    /**
     * @return the tiposTransacoes
     */
    public List<TipoTransacao> getTiposTransacoes() {
        return tiposTransacoes;
    }

    /**
     * @param tiposTransacoes the tiposTransacoes to set
     */
    public void setTiposTransacoes(List<TipoTransacao> tiposTransacoes) {
        this.tiposTransacoes = tiposTransacoes;
    }

    /**
     * @return the estruturaDiretorio
     */
    public int getEstruturaDiretorio() {
        return estruturaDiretorio;
    }

    /**
     * @param estruturaDiretorio the estruturaDiretorio to set
     */
    public void setEstruturaDiretorio(int estruturaDiretorio) {
        this.estruturaDiretorio = estruturaDiretorio;
    }

    /**
     * @return the server
     */
    public int getServer() {
        return server;
    }

    /**
     * @param server the server to set
     */
    public void setServer(int server) {
        this.server = server;
    }

    /**
     * @return the qtdAdquirida
     */
    public int getQtdAdquirida() {
        return qtdAdquirida;
    }

    /**
     * @param qtdAdquirida the qtdAdquirida to set
     */
    public void setQtdAdquirida(int qtdAdquirida) {
        this.qtdAdquirida = qtdAdquirida;
    }

    /**
     * @return the concatenaCodigoUrl
     */
    public boolean isConcatenaCodigoUrl() {
        return concatenaCodigoUrl;
    }

    /**
     * @param concatenaCodigoUrl the concatenaCodigoUrl to set
     */
    public void setConcatenaCodigoUrl(boolean concatenaCodigoUrl) {
        this.concatenaCodigoUrl = concatenaCodigoUrl;
    }

    /**
     * @return the ordemExibicaCrescente
     */
    public boolean isOrdemExibicaCrescente() {
        return ordemExibicaCrescente;
    }

    /**
     * @param ordemExibicaCrescente the ordemExibicaCrescente to set
     */
    public void setOrdemExibicaCrescente(boolean ordemExibicaCrescente) {
        this.ordemExibicaCrescente = ordemExibicaCrescente;
    }

    /**
     * @return the transacaoCorrecaoImg
     */
    public boolean isTransacaoCorrecaoImg() {
        return transacaoCorrecaoImg;
    }

    /**
     * @param transacaoCorrecaoImg the transacaoCorrecaoImg to set
     */
    public void setTransacaoCorrecaoImg(boolean transacaoCorrecaoImg) {
        this.transacaoCorrecaoImg = transacaoCorrecaoImg;
    }

    /**
     * @return the ipServer
     */
    public String getIpServer() {
        return ipServer;
    }

    /**
     * @param ipServer the ipServer to set
     */
    public void setIpServer(String ipServer) {
        this.ipServer = ipServer;
    }

    /**
     * @return the concessionaria
     */
    public Concessionaria getConcessionaria() {
        return concessionaria;
    }

    /**
     * @param concessionaria the concessionaria to set
     */
    public void setConcessionaria(Concessionaria concessionaria) {
        this.concessionaria = concessionaria;
    }

    @Override
    public Replicable replicate(Object o) {
        ConfiguracaoImagem c = new ConfiguracaoImagem();
        c.setId(null);
        c.setConcatenaCodigoUrl(concatenaCodigoUrl);
        c.setConcessionaria((Concessionaria)o);
        c.setEstruturaDiretorio(estruturaDiretorio);
        c.setIpServer(ipServer);
        c.setOrdemExibicaCrescente(ordemExibicaCrescente);
        c.setQtdAdquirida(qtdAdquirida);
        c.setServer(server);
        c.setTransacaoCorrecaoImg(transacaoCorrecaoImg);
        
        List<TipoPista> listaTP = new ArrayList<TipoPista>();
        for(TipoPista tp : getTipoPista()){
            if(tp!=null){
                listaTP.add((TipoPista)tp.replicate(c));
            }
        }
        c.setTipoPista(listaTP);
        
        List<TipoTransacao> listaTT = new ArrayList<TipoTransacao>();
        for(TipoTransacao tt : getTiposTransacoes()){
            if(tt!=null){
                listaTT.add((TipoTransacao)tt.replicate(c));
            }
        }
        c.setTiposTransacoes(listaTT);
        return c;
    }
    
}
