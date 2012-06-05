package com.compsis.sigf.dao;

import com.compsis.sigf.domain.Insert;

/**
 *
 * @author Lucas Israel
 */
public class InsertDAO extends BaseDAO<Insert> {
    private InsertDAO(){
        super(Insert.class);
    }
    private static InsertDAO dao;
    public static InsertDAO getInstance(){
        if(dao == null){
            dao = new InsertDAO();
        }
        return dao;
    }
}
