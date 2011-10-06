package com.compsis.sigf.dao;

import com.compsis.sigf.domain.ConfiguracaoPraca;

/**
 *
 * @author Lucas Israel
 */
public class ConfiguracaoPracaDAO extends BaseDAO<ConfiguracaoPraca> {
    private ConfiguracaoPracaDAO(){
        super(ConfiguracaoPraca.class);
    }
    private static ConfiguracaoPracaDAO dao;
    public static ConfiguracaoPracaDAO getInstance(){
        if(dao == null){
            dao = new ConfiguracaoPracaDAO();
        }
        return dao;
    }
}
