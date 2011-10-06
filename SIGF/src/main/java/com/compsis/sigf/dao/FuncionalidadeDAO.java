package com.compsis.sigf.dao;

import com.compsis.sigf.domain.Funcionalidade;
import com.compsis.sigf.domain.FuncionalidadeConcessionaria;
import com.compsis.sigf.utils.GenericsUtil;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Lucas Israel
 */
public class FuncionalidadeDAO extends BaseDAO<Funcionalidade> {
    private FuncionalidadeDAO(){
        super(Funcionalidade.class);
    }
    
    private static FuncionalidadeDAO dao;
    public static FuncionalidadeDAO getInstance(){
        if(dao == null){
            dao = new FuncionalidadeDAO();
        }
        return dao;
    }
    
    public List<Funcionalidade> getByFuncConcessionaria(List<FuncionalidadeConcessionaria> lista){
        StringBuffer sb = new StringBuffer();
        Criteria criteria = this.createCriteria(Funcionalidade.class);
        Set<Integer> ids = new HashSet<Integer>();
        for(FuncionalidadeConcessionaria fc : lista){
            if(fc!=null){
                ids.add(fc.getFuncionalidade().getIdFuncionalidade());
            }
        }
        criteria.add(Restrictions.in("idFuncionalidade", ids));
        return GenericsUtil.checkedList(criteria.list(), Funcionalidade.class);
    }
}
