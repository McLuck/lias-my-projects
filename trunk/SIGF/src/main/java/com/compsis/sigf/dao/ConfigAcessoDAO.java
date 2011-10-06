package com.compsis.sigf.dao;

import com.compsis.sigf.domain.ConfigAcesso;

/**
 *
 * @author Lucas Israel
 */
public class ConfigAcessoDAO extends BaseDAO<ConfigAcesso> {
    private ConfigAcessoDAO(){
        super(ConfigAcesso.class);
    }
    private static ConfigAcessoDAO dao;
    public static ConfigAcessoDAO getInstance(){
        if(dao == null){
            dao = new ConfigAcessoDAO();
        }
        return dao;
    }
}
