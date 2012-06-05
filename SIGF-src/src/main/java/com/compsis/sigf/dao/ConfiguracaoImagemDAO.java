package com.compsis.sigf.dao;

import com.compsis.sigf.domain.ConfiguracaoImagem;

/**
 *
 * @author Lucas Israel
 */
public class ConfiguracaoImagemDAO extends BaseDAO<ConfiguracaoImagem> {
    private ConfiguracaoImagemDAO(){
        super(ConfiguracaoImagem.class);
    }
    private static ConfiguracaoImagemDAO dao;
    public static ConfiguracaoImagemDAO getInstance(){
        if(dao == null){
            dao = new ConfiguracaoImagemDAO();
        }
        return dao;
    }
}
