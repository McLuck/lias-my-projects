package com.compsis.sigf.domain;

import com.compsis.sigf.base.BaseTemp;

import java.util.ArrayList;
import java.util.List;

/**
 * Compsis
 * @author Lucas Israel
 * @see 11/08/2011
 * @version 1.0
 * 
 */
public class ConfiguracaoPraca extends DomainObject implements Replicable{

    private boolean comunicacaoNobreak;
    private String nobreakMarca;
    private boolean operacaoSimultaneaAntena;
    private boolean detectEixoSuspenso;
    private boolean detectJuntoEixoChao;
    private boolean cobrancaEixo;
    private int cvModelo;
    private boolean cvAlarmeViolacao;
    private boolean cvAlarmeMudancaTarifa;
    private boolean cvAlarmePanico;
    private boolean cvOutrosAlarmes;
    private String cvDesOutrosAlarmes, phase;
    private boolean cvFechamentoFimTurno;
    private boolean cvFechamentoRefeicao;
    private boolean cvTrocaPista;
    private boolean cvFechamentoQTO;
    private boolean cvFechamentoAntecipado;
    private boolean cvFechamentoManutencao;
    private boolean cvIgnorarFalhaEquipamento;
    private boolean cvIgnorarMarchaRe;
    private boolean cvIgnorarManutencao;
    private boolean cvClassificaArmazenaSA;
    private List<AntenaPista> antenaPista;
    private Praca praca;
    private int pracaid, sensorAVI, sensorPistManual, sensorPistMoto;

    public ConfiguracaoPraca(Praca praca) {
        antenaPista = new ArrayList<AntenaPista>();
        this.praca = praca;
    }
    
    public ConfiguracaoPraca(){
    }

    /**
     * @return the comunicacaoNobreak
     */
    public boolean isComunicacaoNobreak() {
        return comunicacaoNobreak;
    }

    /**
     * @param comunicacaoNobreak the comunicacaoNobreak to set
     */
    public void setComunicacaoNobreak(boolean comunicacaoNobreak) {
        this.comunicacaoNobreak = comunicacaoNobreak;
    }

    /**
     * @return the nobreakMarca
     */
    public String getNobreakMarca() {
        return nobreakMarca;
    }

    /**
     * @param nobreakMarca the nobreakMarca to set
     */
    public void setNobreakMarca(String nobreakMarca) {
        this.nobreakMarca = nobreakMarca;
    }

    /**
     * @return the operacaoSimultaneaAntena
     */
    public boolean isOperacaoSimultaneaAntena() {
        return operacaoSimultaneaAntena;
    }

    /**
     * @param operacaoSimultaneaAntena the operacaoSimultaneaAntena to set
     */
    public void setOperacaoSimultaneaAntena(boolean operacaoSimultaneaAntena) {
        this.operacaoSimultaneaAntena = operacaoSimultaneaAntena;
    }

    /**
     * @return the detectEixoSuspenso
     */
    public boolean isDetectEixoSuspenso() {
        return detectEixoSuspenso;
    }

    /**
     * @param detectEixoSuspenso the detectEixoSuspenso to set
     */
    public void setDetectEixoSuspenso(boolean detectEixoSuspenso) {
        this.detectEixoSuspenso = detectEixoSuspenso;
    }

    /**
     * @return the detectJuntoEixoChao
     */
    public boolean isDetectJuntoEixoChao() {
        return detectJuntoEixoChao;
    }

    /**
     * @param detectJuntoEixoChao the detectJuntoEixoChao to set
     */
    public void setDetectJuntoEixoChao(boolean detectJuntoEixoChao) {
        this.detectJuntoEixoChao = detectJuntoEixoChao;
    }

    /**
     * @return the cobrancaEixo
     */
    public boolean isCobrancaEixo() {
        return cobrancaEixo;
    }

    /**
     * @param cobrancaEixo the cobrancaEixo to set
     */
    public void setCobrancaEixo(boolean cobrancaEixo) {
        this.cobrancaEixo = cobrancaEixo;
    }

    /**
     * @return the cvModelo
     */
    public int getCvModelo() {
        return cvModelo;
    }

    /**
     * @param cvModelo the cvModelo to set
     */
    public void setCvModelo(int cvModelo) {
        this.cvModelo = cvModelo;
    }

    /**
     * @return the cvAlarmeViolacao
     */
    public boolean isCvAlarmeViolacao() {
        return cvAlarmeViolacao;
    }

    /**
     * @param cvAlarmeViolacao the cvAlarmeViolacao to set
     */
    public void setCvAlarmeViolacao(boolean cvAlarmeViolacao) {
        this.cvAlarmeViolacao = cvAlarmeViolacao;
    }

    /**
     * @return the cvAlarmeMudancaTarifa
     */
    public boolean isCvAlarmeMudancaTarifa() {
        return cvAlarmeMudancaTarifa;
    }

    /**
     * @param cvAlarmeMudancaTarifa the cvAlarmeMudancaTarifa to set
     */
    public void setCvAlarmeMudancaTarifa(boolean cvAlarmeMudancaTarifa) {
        this.cvAlarmeMudancaTarifa = cvAlarmeMudancaTarifa;
    }

    /**
     * @return the cvAlarmePanico
     */
    public boolean isCvAlarmePanico() {
        return cvAlarmePanico;
    }

    /**
     * @param cvAlarmePanico the cvAlarmePanico to set
     */
    public void setCvAlarmePanico(boolean cvAlarmePanico) {
        this.cvAlarmePanico = cvAlarmePanico;
    }

    /**
     * @return the cvOutrosAlarmes
     */
    public boolean isCvOutrosAlarmes() {
        return cvOutrosAlarmes;
    }

    /**
     * @param cvOutrosAlarmes the cvOutrosAlarmes to set
     */
    public void setCvOutrosAlarmes(boolean cvOutrosAlarmes) {
        this.cvOutrosAlarmes = cvOutrosAlarmes;
    }

    /**
     * @return the cvDesOutrosAlarmes
     */
    public String getCvDesOutrosAlarmes() {
        return cvDesOutrosAlarmes;
    }

    /**
     * @param cvDesOutrosAlarmes the cvDesOutrosAlarmes to set
     */
    public void setCvDesOutrosAlarmes(String cvDesOutrosAlarmes) {
        this.cvDesOutrosAlarmes = cvDesOutrosAlarmes;
    }

    /**
     * @return the cvFechamentoFimTurno
     */
    public boolean isCvFechamentoFimTurno() {
        return cvFechamentoFimTurno;
    }

    /**
     * @param cvFechamentoFimTurno the cvFechamentoFimTurno to set
     */
    public void setCvFechamentoFimTurno(boolean cvFechamentoFimTurno) {
        this.cvFechamentoFimTurno = cvFechamentoFimTurno;
    }

    /**
     * @return the cvFechamentoRefeicao
     */
    public boolean isCvFechamentoRefeicao() {
        return cvFechamentoRefeicao;
    }

    /**
     * @param cvFechamentoRefeicao the cvFechamentoRefeicao to set
     */
    public void setCvFechamentoRefeicao(boolean cvFechamentoRefeicao) {
        this.cvFechamentoRefeicao = cvFechamentoRefeicao;
    }

    /**
     * @return the cvTrocaPista
     */
    public boolean isCvTrocaPista() {
        return cvTrocaPista;
    }

    /**
     * @param cvTrocaPista the cvTrocaPista to set
     */
    public void setCvTrocaPista(boolean cvTrocaPista) {
        this.cvTrocaPista = cvTrocaPista;
    }

    /**
     * @return the cvFechamentoQTO
     */
    public boolean isCvFechamentoQTO() {
        return cvFechamentoQTO;
    }

    /**
     * @param cvFechamentoQTO the cvFechamentoQTO to set
     */
    public void setCvFechamentoQTO(boolean cvFechamentoQTO) {
        this.cvFechamentoQTO = cvFechamentoQTO;
    }

    /**
     * @return the cvFechamentoAntecipado
     */
    public boolean isCvFechamentoAntecipado() {
        return cvFechamentoAntecipado;
    }

    /**
     * @param cvFechamentoAntecipado the cvFechamentoAntecipado to set
     */
    public void setCvFechamentoAntecipado(boolean cvFechamentoAntecipado) {
        this.cvFechamentoAntecipado = cvFechamentoAntecipado;
    }

    /**
     * @return the cvFechamentoManutencao
     */
    public boolean isCvFechamentoManutencao() {
        return cvFechamentoManutencao;
    }

    /**
     * @param cvFechamentoManutencao the cvFechamentoManutencao to set
     */
    public void setCvFechamentoManutencao(boolean cvFechamentoManutencao) {
        this.cvFechamentoManutencao = cvFechamentoManutencao;
    }

    /**
     * @return the cvIgnorarFalhaEquipamento
     */
    public boolean isCvIgnorarFalhaEquipamento() {
        return cvIgnorarFalhaEquipamento;
    }

    /**
     * @param cvIgnorarFalhaEquipamento the cvIgnorarFalhaEquipamento to set
     */
    public void setCvIgnorarFalhaEquipamento(boolean cvIgnorarFalhaEquipamento) {
        this.cvIgnorarFalhaEquipamento = cvIgnorarFalhaEquipamento;
    }

    /**
     * @return the cvIgnorarMarchaRe
     */
    public boolean isCvIgnorarMarchaRe() {
        return cvIgnorarMarchaRe;
    }

    /**
     * @param cvIgnorarMarchaRe the cvIgnorarMarchaRe to set
     */
    public void setCvIgnorarMarchaRe(boolean cvIgnorarMarchaRe) {
        this.cvIgnorarMarchaRe = cvIgnorarMarchaRe;
    }

    /**
     * @return the cvIgnorarManutencao
     */
    public boolean isCvIgnorarManutencao() {
        return cvIgnorarManutencao;
    }

    /**
     * @param cvIgnorarManutencao the cvIgnorarManutencao to set
     */
    public void setCvIgnorarManutencao(boolean cvIgnorarManutencao) {
        this.cvIgnorarManutencao = cvIgnorarManutencao;
    }

    /**
     * @return the cvClassificaArmazenaSA
     */
    public boolean isCvClassificaArmazenaSA() {
        return cvClassificaArmazenaSA;
    }

    /**
     * @param cvClassificaArmazenaSA the cvClassificaArmazenaSA to set
     */
    public void setCvClassificaArmazenaSA(boolean cvClassificaArmazenaSA) {
        this.cvClassificaArmazenaSA = cvClassificaArmazenaSA;
    }

    /**
     * @return the antenaPista
     */
    public List<AntenaPista> getAntenaPista() {
        return antenaPista;
    }

    /**
     * @param antenaPista the antenaPista to set
     */
    public void setAntenaPista(List<AntenaPista> antenaPista) {
        this.antenaPista = antenaPista;
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

    /**
     * @return the phase
     */
    public String getPhase() {
        return phase;
    }

    /**
     * @param phase the phase to set
     */
    public void setPhase(String phase) {
        this.phase = phase;
    }

    /**
     * @return the pracaid
     */
    public int getPracaid() {
        return pracaid;
    }

    /**
     * @param pracaid the pracaid to set
     */
    public void setPracaid(int pracaid) {
        this.pracaid = pracaid;
    }

    /**
     * @return the sensorAVI
     */
    public int getSensorAVI() {
        return sensorAVI;
    }

    /**
     * @param sensorAVI the sensorAVI to set
     */
    public void setSensorAVI(int sensorAVI) {
        this.sensorAVI = sensorAVI;
    }

    /**
     * @return the sensorPistManual
     */
    public int getSensorPistManual() {
        return sensorPistManual;
    }

    /**
     * @param sensorPistManual the sensorPistManual to set
     */
    public void setSensorPistManual(int sensorPistManual) {
        this.sensorPistManual = sensorPistManual;
    }

    /**
     * @return the sensorPistMoto
     */
    public int getSensorPistMoto() {
        return sensorPistMoto;
    }

    /**
     * @param sensorPistMoto the sensorPistMoto to set
     */
    public void setSensorPistMoto(int sensorPistMoto) {
        this.sensorPistMoto = sensorPistMoto;
    }

    @Override
    public Replicable replicate(Object o) {
        ConfiguracaoPraca c = new ConfiguracaoPraca();
        
        c.setId(null);
        c.setCobrancaEixo(cobrancaEixo);
        List<AntenaPista> listaAN = new ArrayList<AntenaPista>();
        for(AntenaPista a : getAntenaPista()){
            if(a !=null){
                listaAN.add((AntenaPista)a.replicate(c));
            }
        }
        c.setAntenaPista(listaAN);
        
        c.setComunicacaoNobreak(comunicacaoNobreak);
        c.setCvAlarmeMudancaTarifa(cvAlarmeMudancaTarifa);
        c.setCvAlarmePanico(cvAlarmePanico);
        c.setCvAlarmeViolacao(cvAlarmeViolacao);
        c.setCvClassificaArmazenaSA(cvClassificaArmazenaSA);
        c.setCvDesOutrosAlarmes(cvDesOutrosAlarmes);
        c.setCvFechamentoAntecipado(cvFechamentoAntecipado);
        c.setCvFechamentoFimTurno(cvFechamentoFimTurno);
        c.setCvFechamentoManutencao(cvFechamentoManutencao);
        c.setCvFechamentoQTO(cvFechamentoQTO);
        c.setCvFechamentoRefeicao(cvFechamentoRefeicao);
        c.setCvIgnorarFalhaEquipamento(cvIgnorarFalhaEquipamento);
        c.setCvIgnorarFalhaEquipamento(cvIgnorarFalhaEquipamento);
        c.setCvIgnorarManutencao(cvIgnorarManutencao);
        c.setCvIgnorarMarchaRe(cvIgnorarMarchaRe);
        c.setCvModelo(cvModelo);
        c.setCvOutrosAlarmes(cvOutrosAlarmes);
        c.setCvTrocaPista(cvTrocaPista);
        c.setDetectEixoSuspenso(detectEixoSuspenso);
        c.setDetectJuntoEixoChao(detectJuntoEixoChao);
        c.setNobreakMarca(nobreakMarca);
        c.setOperacaoSimultaneaAntena(operacaoSimultaneaAntena);
        c.setPraca((Praca)o);
        c.setPracaid(pracaid);
        c.setSensorAVI(sensorAVI);
        c.setSensorPistManual(sensorPistManual);
        c.setSensorPistMoto(sensorPistMoto);
        
        return c;
    }
}
