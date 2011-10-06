package com.compsis.sigf.regras.command.sql;

import com.compsis.sigf.regras.command.Command;
import com.compsis.sigf.regras.command.PropertyRetriever;
import com.compsis.sigf.regras.command.UpdateCommand;

/**
 *
 * @author Lucas Israel
 */
public class CaminhoCVCommand implements Command, PropertyRetriever, UpdateCommand{

    
    @Override
    public void execute() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public String getPropertyName() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object getPropertyValue() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void update(Object o) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
}
