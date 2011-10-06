package com.compsis.sigf.regras.command;

import com.compsis.sigf.domain.Concessionaria;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Lucas Israel
 */
public class ConcessionariaCommand implements Command, PropertyRetriever, UpdateCommand{
    
    public ConcessionariaCommand(Concessionaria c){
        this.conc = c;
    }
    private Map param = new HashMap();
    private Concessionaria conc;
    
    @Override
    public void execute() {
        param.put(Command.KEYS.CONCESSIONARIA_CALCULO_CAT_ESP, conc.getCalculoCatEspecial());
        param.put(Command.KEYS.CONCESSIONARIA_HAVERA_CAT_AMBIGUA, conc.isCategoriaAmbigua()?"1":"0");
        param.put(Command.KEYS.CONCESSIONARIA_CORRECAO_AUTO_CAT_AMBIGUA, conc.isCorrecaoAutomaticaCatAmbigua()?"1":"0");
        param.put(Command.KEYS.CONCESSIONARIA_PORCENTAGEM_CORRECAO_AUTO_CAT_AMBIGUA, conc.getPercentCorrecaoAutoCatAmb());
        param.put(Command.KEYS.CONCESSIONARIA_ORIGEM_ARQUIVO_CAT_AMBIGUA, conc.getOrigemNomeArquivo());
        param.put(Command.KEYS.CONCESSIONARIA_PRACAS_EXIBE_DETALHES_CABECALHO, conc.isExibirDescricaoPracaRelatorios());
        param.put(Command.KEYS.CONCESSIONARIA_PRACAS_EXIBE_DETALHES_CABECALHO, conc.isExibirDescricaoPracaRelatorios());
        param.put(Command.KEYS.CONCESSIONARIA_ID_CONCESSIONARIA_ORIGEM, GeralConverte.IDS.GET_ID_CONCESSIONARIA(conc));
        param.put(Command.KEYS.CONCESSIONARIA_OBJETO, conc);
    }

    @Override
    public String getPropertyName() {
        return Command.KEYS.ConcessionariaCommand;
    }

    @Override
    public Object getPropertyValue() {
        return param;
    }

    @Override
    public void update(Object o) {
        this.conc = (Concessionaria)o;
    }
    
}
