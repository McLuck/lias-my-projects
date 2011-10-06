package com.compsis.sigf.regras.command;

import com.compsis.sigf.domain.Praca;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Lucas Israel
 */
public class PracaCommand implements Command, PropertyRetriever, UpdateCommand{
    public PracaCommand(Praca praca){
        this.praca = praca;
    }
    private Praca praca;
    private Map param = new HashMap();
    
    @Override
    public void execute() {
        param.put(Command.KEYS.PRACA_ID_PRACA_ORIGEM, GeralConverte.IDS.GET_ID_PRACA(praca));
        param.put(Command.KEYS.PRACA_ID_LOCALIZACAO_ORIGEM, GeralConverte.IDS.GET_ID_LOCALIZACAO(praca));
        param.put(Command.KEYS.PRACA_ID_SENTIDO_ORIGEM1, GeralConverte.IDS.GET_ID_SENTIDO(praca, 1));
        param.put(Command.KEYS.PRACA_ID_SENTIDO_ORIGEM2, GeralConverte.IDS.GET_ID_SENTIDO(praca, 2));
    }

    @Override
    public String getPropertyName() {
        return Command.KEYS.PracaCommand;
    }

    @Override
    public Object getPropertyValue() {
        return param;
    }

    @Override
    public void update(Object o) {
        this.praca = (Praca)o;
    }
    
}
