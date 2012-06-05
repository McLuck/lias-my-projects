package com.compsis.sigf.regras.command;

import com.compsis.sigf.domain.ConfiguracaoImagem;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Lucas Israel
 */
public class ConfiguracaoImagemCommand implements Command, PropertyRetriever, UpdateCommand{
    private Map param = new HashMap();
    private ConfiguracaoImagem conf;
    
    public ConfiguracaoImagemCommand(ConfiguracaoImagem cfg){
        conf = cfg;
    }
    
    @Override
    public void execute() {
        param.put(Command.KEYS.CONF_IMAGEM_IP_SERVER, "http://"+conf.getIpServer()+":18080/vasves");
        param.put(Command.KEYS.CONF_IMAGEM_ESTRUTURA_IMAGEM, conf.getEstruturaDiretorio());
        param.put(Command.KEYS.CONF_IMAGEM_CONCATENAR_URL_IMAGEM, conf.isConcatenaCodigoUrl()? "1" : "0");
        param.put(Command.KEYS.CONF_IMAGEM_IMAGENS_EXIBIDAS_INVERTIDAS, conf.isOrdemExibicaCrescente()? "1" : "0");
        param.put(Command.KEYS.CONF_IMAGEM_TRANSACAO_CORRECAO_IMG, conf.isTransacaoCorrecaoImg()? "1" : "0");
    }

    @Override
    public String getPropertyName() {
        return Command.KEYS.ConfiguracaoImagemCommand;
    }

    @Override
    public Object getPropertyValue() {
        return param;
    }

    @Override
    public void update(Object o) {
        this.conf = (ConfiguracaoImagem)o;
    }
    
}
