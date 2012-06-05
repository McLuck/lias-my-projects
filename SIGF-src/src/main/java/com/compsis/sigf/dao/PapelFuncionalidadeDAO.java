package com.compsis.sigf.dao;

import com.compsis.sigf.domain.*;
import com.compsis.sigf.utils.GenericsUtil;
import java.util.*;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Lucas Israel
 */
public class PapelFuncionalidadeDAO extends BaseDAO<PapelFuncionalidade> {
    private PapelFuncionalidadeDAO(){
        super(PapelFuncionalidade.class);
    }
    private static PapelFuncionalidadeDAO dao;
    public static PapelFuncionalidadeDAO getInstance(){
        if(dao == null){
            dao = new PapelFuncionalidadeDAO();
        }
        return dao;
    }
    public List<PapelFuncionalidade> getByFuncionalidade(Funcionalidade funcionalidade){
        return getByFuncionalidade(funcionalidade.getId());
    }
    public List<PapelFuncionalidade> getByFuncionalidade(int idFuncionalidade){
        Criteria criteria = this.createCriteria(PapelFuncionalidade.class);
        criteria.add(Restrictions.eq("idFuncionalidade", idFuncionalidade));
        return GenericsUtil.checkedList(criteria.list(), PapelFuncionalidade.class);
    }
}
