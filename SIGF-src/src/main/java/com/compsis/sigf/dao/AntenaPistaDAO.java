package com.compsis.sigf.dao;

import com.compsis.sigf.domain.AntenaPista;

/**
 *
 * @author Lucas Israel
 */
public class AntenaPistaDAO extends BaseDAO<AntenaPista> {
    private AntenaPistaDAO(){
        super(AntenaPista.class);
    }
    
    private static AntenaPistaDAO dao;
    public static AntenaPistaDAO getInstance(){
        if(dao == null){
            dao = new AntenaPistaDAO();
        }
        return dao;
    }
}
