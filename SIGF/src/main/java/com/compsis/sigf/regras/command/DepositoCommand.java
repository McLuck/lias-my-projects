package com.compsis.sigf.regras.command;

import com.compsis.sigf.domain.Malote;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Lucas Israel
 */
public class DepositoCommand implements Command, PropertyRetriever, UpdateCommand{
    private Map param = new HashMap();
    private Malote mal;
    
    public DepositoCommand(Malote m ){
        mal = m;
    }
    
    @Override
    public void execute() {
        param.put(Command.KEYS.MALOTE_ID_REPETE, mal.isLacreRepete()?"0":"1");
        param.put(Command.KEYS.MALOTE_DIAS_SEM_REPETIR, mal.getDiasSemRepetirLacre());
        param.put(Command.KEYS.MALOTE_OPC_CRIACAO_MALOTE, mal.getOpcCriacaoMalote());
        param.put(Command.KEYS.MALOTE_OPC_REGISTRO_DEPOSITO, mal.getOpcRegistroDeposito());
        param.put(Command.KEYS.MALOTE_DETALHE_CRIACAO_ARQUIVO_BANCARIO, mal.getDetalheFormatoArquivo());
        param.put(Command.KEYS.MALOTE_EXIBICAO_INTERFACE, mal.getOpcExibicaoInterface());
    }

    @Override
    public String getPropertyName() {
        return Command.KEYS.DepositoCommand;
    }

    @Override
    public Object getPropertyValue() {
        return param;
    }

    @Override
    public void update(Object o) {
        this.mal = (Malote)o;
    }
    
}
