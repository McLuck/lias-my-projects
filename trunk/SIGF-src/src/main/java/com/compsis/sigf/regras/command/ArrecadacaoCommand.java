package com.compsis.sigf.regras.command;

import com.compsis.sigf.domain.Arrecadacao;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Lucas Israel
 */
public class ArrecadacaoCommand implements Command, PropertyRetriever, UpdateCommand{

    public ArrecadacaoCommand(Arrecadacao a){
        arrec = a;
    }
    
    private Map param = new HashMap();
    private Arrecadacao arrec;
    
    @Override
    public void execute() {
        param.put(Command.KEYS.ARRECADACAO_FORM_DEV_TROCO, arrec.getFormaDevTroco());
        param.put(Command.KEYS.ARRECADACAO_ARRECADADOR, arrec.getFormArrecadador());
        param.put(Command.KEYS.ARRECADACAO_COLETOR_SANGRIA, arrec.getFormSangria());
        param.put(Command.KEYS.ARRECADACAO_RESPONS_PISTA, arrec.getFormRespPista());
        param.put(Command.KEYS.ARRECADACAO_SUPERVISOR, arrec.getFormSupervisor());
        param.put(Command.KEYS.ARRECADACAO_VENDEDOR_CUPON, arrec.getFormVendCupons());
    }

    @Override
    public String getPropertyName() {
        return Command.KEYS.ArrecadacaoCommand;
    }

    @Override
    public Object getPropertyValue() {
        return param;
    }

    @Override
    public void update(Object o) {
        this.arrec = (Arrecadacao)o;
    }
    
}
