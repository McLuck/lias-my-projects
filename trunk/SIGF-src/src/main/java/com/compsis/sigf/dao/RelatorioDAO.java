package com.compsis.sigf.dao;

import com.compsis.sigf.domain.Relatorio;

/**
 *
 * @author Lucsa Israel
 */
public class RelatorioDAO extends BaseDAO<Relatorio> {
    private RelatorioDAO(){
        super(Relatorio.class);
    }
    private static RelatorioDAO dao;
    public static RelatorioDAO getInstance(){
        if(dao == null){
            dao = new RelatorioDAO();
        }
        return dao;
    }
}
