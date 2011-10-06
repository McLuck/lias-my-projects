package com.compsis.sigf.dao;

import com.compsis.sigf.domain.Categoria;

/**
 *
 * @author Lucas Israel
 */
public class CategoriaDAO extends BaseDAO<Categoria> {
    private CategoriaDAO(){
        super(Categoria.class);
    }
    private static CategoriaDAO dao;
    public static CategoriaDAO getInstance(){
        if(dao == null){
            dao = new CategoriaDAO();
        }
        return dao;
    }
}
