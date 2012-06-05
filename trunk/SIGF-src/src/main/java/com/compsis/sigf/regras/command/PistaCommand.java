package com.compsis.sigf.regras.command;

import com.compsis.sigf.domain.Pista;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Lucas Israel
 */
public class PistaCommand  implements Command, PropertyRetriever, UpdateCommand{

    public PistaCommand(Pista pista){
        this.pista = pista;
    }
    private Pista pista;
    private Map param = new HashMap();
    @Override
    public void execute() {
        
    }

    @Override
    public String getPropertyName() {
        return Command.KEYS.PistaCommand;
    }

    @Override
    public Object getPropertyValue() {
        return param;
    }

    @Override
    public void update(Object o) {
        pista = (Pista)o;
    }
    
}
