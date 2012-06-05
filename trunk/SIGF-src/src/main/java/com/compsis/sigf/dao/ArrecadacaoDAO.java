package com.compsis.sigf.dao;

import com.compsis.sigf.domain.Arrecadacao;

/**
 *
 * @author Lucas Israel
 */
public class ArrecadacaoDAO extends BaseDAO<Arrecadacao> {
    private ArrecadacaoDAO(){
        super(Arrecadacao.class);
    }
    private static ArrecadacaoDAO dao;
    public static ArrecadacaoDAO getInstance(){
        if(dao == null){
            dao = new ArrecadacaoDAO();
        }
        return dao;
    }
}
