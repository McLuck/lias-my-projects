package com.compsis.sigf.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import com.compsis.sigf.domain.Pista;
import com.compsis.sigf.domain.Sentido;
import com.compsis.sigf.utils.GenericsUtil;

/**
 *
 * @author Lucas Israel
 */
public class SentidoDAO extends BaseDAO<Sentido>  {

    private SentidoDAO(){
        super(Sentido.class);
    }
    
    private static SentidoDAO dao;
    public static SentidoDAO getInstance(){
        if(dao == null){
            dao = new SentidoDAO();
        }
        return dao;
    }
    
    public List<Sentido> getByPraca(int pracaId){
    	Criteria criteria = this.createCriteria(Sentido.class);
        criteria.createCriteria("localizacao").createCriteria("praca").add(Restrictions.eq("id", pracaId));
        return GenericsUtil.checkedList(criteria.list(), Sentido.class);
    }
    
    public List<Sentido> getByLocalizacao(int localizacaoId){
    	Criteria criteria = this.createCriteria(Sentido.class);
    	criteria.createCriteria("localizacao").add(Restrictions.eq("id", localizacaoId));
    	return GenericsUtil.checkedList(criteria.list(), Sentido.class);
    }
}
