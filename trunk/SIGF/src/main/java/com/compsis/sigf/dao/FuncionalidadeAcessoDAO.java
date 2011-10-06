package com.compsis.sigf.dao;

import com.compsis.sigf.domain.*;
import com.compsis.sigf.utils.GenericsUtil;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
/**
 *
 * @author Lucas Israel
 */
public class FuncionalidadeAcessoDAO extends BaseDAO<FuncionalidadeAcesso> {
    private FuncionalidadeAcessoDAO(){
        super(FuncionalidadeAcesso.class);
    }
    
    public List<FuncionalidadeAcesso> getByFuncionalidade(Funcionalidade funcionalidade){
        return getByFuncionalidade(funcionalidade.getId());
    }
    public List<FuncionalidadeAcesso> getByFuncionalidade(int idFuncionalidade){
        Criteria criteria = this.createCriteria(FuncionalidadeAcesso.class);
        criteria.add(Restrictions.eq("idFuncionalidade", idFuncionalidade));
        return GenericsUtil.checkedList(criteria.list(), FuncionalidadeAcesso.class);
    }
    
    private static FuncionalidadeAcessoDAO dao;
    public static FuncionalidadeAcessoDAO getInstance(){
        if(dao == null){
            dao = new FuncionalidadeAcessoDAO();
        }
        return dao;
    }
}
