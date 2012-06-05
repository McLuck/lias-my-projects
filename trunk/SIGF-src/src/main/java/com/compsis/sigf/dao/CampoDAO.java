package com.compsis.sigf.dao;

import com.compsis.sigf.domain.Campo;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.utils.GenericsUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;


/**
 *
 * @author Lucas Israel
 */
public class CampoDAO extends BaseDAO<Campo> {
    private CampoDAO(){
        super(Campo.class);
    }
    private static CampoDAO dao;
    public static CampoDAO getInstance(){
        if(dao == null){
            dao = new CampoDAO();
        }
        return dao;
    }
    
    /**
     * {@inheritDoc}
     */
    public List<Campo> getByNomeAndTabela(String nome, Integer tabela_id) {
        Criteria criteria = this.createCriteria(Campo.class);
        criteria.add(Restrictions.and(Restrictions.eq("nome", nome), Restrictions.eq("tabela.id", tabela_id)));
        return GenericsUtil.checkedList(criteria.list(), Campo.class);
    }
    
    public List<Campo> getByVersao(Integer versao) {
        Criteria criteria = this.createCriteria(Campo.class);
        criteria.add(Restrictions.eq("tabela.versao.id", versao));
        return GenericsUtil.checkedList(criteria.list(), Campo.class);
    }
}
