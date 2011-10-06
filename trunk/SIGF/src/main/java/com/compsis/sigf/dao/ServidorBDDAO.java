package com.compsis.sigf.dao;

import com.compsis.sigf.domain.ServidorBD;

/**
 *
 * @author Lucas Israel
 */
public class ServidorBDDAO extends BaseDAO<ServidorBD> {
    private ServidorBDDAO(){
        super(ServidorBD.class);
    }
    private static ServidorBDDAO dao;
    public static ServidorBDDAO getInstance(){
        if(dao == null){
            dao = new ServidorBDDAO();
        }
        return dao;
    }
}
