package com.compsis.sigf.dao;


import com.compsis.sigf.domain.MeioPagamento;

/**
 *
 * @author Lucas Israel
 */
public class MeioPagamentoDAO extends BaseDAO<MeioPagamento> {
    private MeioPagamentoDAO(){
        super(MeioPagamento.class);
    }
    private static MeioPagamentoDAO dao;
    public static MeioPagamentoDAO getInstance(){
        if(dao == null){
            dao = new MeioPagamentoDAO();
        }
        return dao;
    }
}
