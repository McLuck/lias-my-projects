package com.compsis.sigf.dao;

import com.compsis.sigf.domain.TipoPista;

/**
 *
 * @author Lucas Israel
 */
public class TipoPistaDAO extends BaseDAO<TipoPista> {
    private TipoPistaDAO(){
        super(TipoPista.class);
    }
    private static TipoPistaDAO dao;
    public static TipoPistaDAO getInstance(){
        if(dao == null){
            dao = new TipoPistaDAO();
        }
        return dao;
    }
}
