package com.compsis.sigf.regras.command;

import com.compsis.sigf.domain.ConfiguracaoPraca;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Lucas Israel
 */
public class ConfiguracaoPracaCommand implements Command, PropertyRetriever, UpdateCommand{
    
    private Map param = new HashMap();
    private ConfiguracaoPraca conf;
    
    public ConfiguracaoPracaCommand(ConfiguracaoPraca cfg){
        conf = cfg;
    }
    
    @Override
    public void execute() {
        param.put(Command.KEYS.CONF_PRACA_COBRANCA_EIXO_SUSPENSO, conf.isCobrancaEixo() ? "1" : "0");        
    }

    @Override
    public String getPropertyName() {
        return Command.KEYS.ConfiguracaoPracaCommand;
    }

    @Override
    public Object getPropertyValue() {
        return param;
    }

    @Override
    public void update(Object o) {
        this.conf = (ConfiguracaoPraca)o;
    }
    
}
