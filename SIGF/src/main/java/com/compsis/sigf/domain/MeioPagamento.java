
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
public class MeioPagamento extends DomainObject implements Replicable{
    private int configuracao;
    private String nome, obs;
    private ConfigContato contato;
    private Concessionaria concessionaria;
    private ConfigEquipamento equipamento;
    private String scriptsDependentes, posScripts;
    private boolean habilitado, configEquipamento, configContato, alteravel;
    private List<PracaMeioPagamento> pracaMeiosPagamentos;
    private String idgestor, programartarifa, idmeiopagtotarifa, iddesignacao;
    public boolean isEquipOrContato(){
        return (configContato || configEquipamento);
    }
    
    public MeioPagamento(boolean configEq, boolean configCont){
        this.configEquipamento = configEq;
        this.configContato = configCont;
    }
    
    public MeioPagamento(){
        contato = new ConfigContato();
        equipamento = new ConfigEquipamento();
    }

    /**
     * @return the configuracao
     */
    public int getConfiguracao() {
        return configuracao;
    }

    /**
     * @param configuracao the configuracao to set
     */
    public void setConfiguracao(int configuracao) {
        this.configuracao = configuracao;
    }

    /**
     * @return the habilitado
     */
    public boolean isHabilitado() {
        return habilitado;
    }

    /**
     * @param habilitado the habilitado to set
     */
    public void setHabilitado(boolean habilitado) {
        this.habilitado = habilitado;
    }

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
     * @return the obs
     */
    public String getObs() {
        return obs;
    }

    /**
     * @param obs the obs to set
     */
    public void setObs(String obs) {
        this.obs = obs;
    }

    /**
     * @return the configEquipamento
     */
    public boolean isConfigEquipamento() {
        return configEquipamento;
    }

    /**
     * @param configEquipamento the configEquipamento to set
     */
    public void setConfigEquipamento(boolean configEquipamento) {
        this.configEquipamento = configEquipamento;
    }

    /**
     * @return the configContato
     */
    public boolean isConfigContato() {
        return configContato;
    }

    /**
     * @param configContato the configContato to set
     */
    public void setConfigContato(boolean configContato) {
        this.configContato = configContato;
    }

    /**
     * @return the equipamento
     */
    public ConfigEquipamento getEquipamento() {
        return equipamento;
    }

    /**
     * @param equipamento the equipamento to set
     */
    public void setEquipamento(ConfigEquipamento equipamento) {
        this.equipamento = equipamento;
    }

    /**
     * @return the contato
     */
    public ConfigContato getContato() {
        return contato;
    }

    /**
     * @param contato the contato to set
     */
    public void setContato(ConfigContato contato) {
        this.contato = contato;
    }

    @Override
    public Replicable replicate(Object o) {
        MeioPagamento mp = new MeioPagamento();
        mp.setConfigContato(configContato);
        mp.setConfigEquipamento(configEquipamento);
        mp.setConfiguracao(configuracao);
        mp.setContato(contato);
        mp.setEquipamento(equipamento);
        mp.setHabilitado(habilitado);
        mp.setScriptsDependentes(scriptsDependentes);
        mp.setPracaMeiosPagamentos(new ArrayList<PracaMeioPagamento>());
        mp.setId(null);
        mp.setNome(nome);
        mp.setAlteravel(alteravel);
        mp.setIddesignacao(iddesignacao);
        mp.setIdgestor(idgestor);
        mp.setIdmeiopagtotarifa(idmeiopagtotarifa);
        mp.setPosScripts(posScripts);
        mp.setProgramartarifa(programartarifa);
        mp.setObs(obs);
        mp.setConcessionaria((Concessionaria)o);
        return mp;
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

    /**
     * @return the scriptsDependentes
     */
    public String getScriptsDependentes() {
        return scriptsDependentes;
    }

    /**
     * @param scriptsDependentes the scriptsDependentes to set
     */
    public void setScriptsDependentes(String scriptsDependentes) {
        this.scriptsDependentes = scriptsDependentes;
    }

    /**
     * @return the pracaMeiosPagamentos
     */
    public List<PracaMeioPagamento> getPracaMeiosPagamentos() {
        return pracaMeiosPagamentos;
    }

    /**
     * @param pracaMeiosPagamentos the pracaMeiosPagamentos to set
     */
    public void setPracaMeiosPagamentos(List<PracaMeioPagamento> pracaMeiosPagamentos) {
        this.pracaMeiosPagamentos = pracaMeiosPagamentos;
    }

    /**
     * @return the idgestor
     */
    public String getIdgestor() {
        return idgestor;
    }

    /**
     * @param idgestor the idgestor to set
     */
    public void setIdgestor(String idgestor) {
        this.idgestor = idgestor;
    }

    /**
     * @return the programartarifa
     */
    public String getProgramartarifa() {
        return programartarifa;
    }

    /**
     * @param programartarifa the programartarifa to set
     */
    public void setProgramartarifa(String programartarifa) {
        this.programartarifa = programartarifa;
    }

    /**
     * @return the idmeiopagtotarifa
     */
    public String getIdmeiopagtotarifa() {
        return idmeiopagtotarifa;
    }

    /**
     * @param idmeiopagtotarifa the idmeiopagtotarifa to set
     */
    public void setIdmeiopagtotarifa(String idmeiopagtotarifa) {
        this.idmeiopagtotarifa = idmeiopagtotarifa;
    }

    /**
     * @return the iddesignacao
     */
    public String getIddesignacao() {
        return iddesignacao;
    }

    /**
     * @param iddesignacao the iddesignacao to set
     */
    public void setIddesignacao(String iddesignacao) {
        this.iddesignacao = iddesignacao;
    }

    /**
     * @return the alteravel
     */
    public boolean isAlteravel() {
        return alteravel;
    }

    /**
     * @param alteravel the alteravel to set
     */
    public void setAlteravel(boolean alteravel) {
        this.alteravel = alteravel;
    }

    /**
     * @return the posScripts
     */
    public String getPosScripts() {
        return posScripts;
    }

    /**
     * @param posScripts the posScripts to set
     */
    public void setPosScripts(String posScripts) {
        this.posScripts = posScripts;
    }
}
