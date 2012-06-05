package com.compsis.sigf.dao;

import com.compsis.sigf.dao.interfaces.PistaInterfaceDAO;
import com.compsis.sigf.domain.Pista;
import com.compsis.sigf.domain.Praca;
import com.compsis.sigf.utils.GenericsUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Lucas Israel
 */
public class PistaDAO extends BaseDAO<Pista> implements PistaInterfaceDAO {

    private PistaDAO(){
        super(Pista.class);
    }
    
    private static PistaDAO dao;
    public static PistaDAO getInstance(){
        if(dao == null){
            dao = new PistaDAO();
        }
        return dao;
    }
   
    @Override
    public List<Pista> getByPraca(int pracaId) {
        Criteria criteria = this.createCriteria(Pista.class);
        criteria.createCriteria("localizacao").createCriteria("praca").add(Restrictions.eq("id", pracaId));
        return GenericsUtil.checkedList(criteria.list(), Pista.class);
    }

    @Override
    public List<Pista> getByTipo(int tipo) {
        Criteria criteria = this.createCriteria(Pista.class);
        criteria.add(Restrictions.eq("tipo", tipo));
        return GenericsUtil.checkedList(criteria.list(), Pista.class);
    }

    @Override
    public List<Pista> getBySentido(int pracaId, int sentido) {
        Criteria criteria = this.createCriteria(Pista.class);
        criteria.add(Restrictions.and(Restrictions.eq("praca.id", pracaId), Restrictions.eq("sentido", sentido)));
        return GenericsUtil.checkedList(criteria.list(), Pista.class);
    }

    @Override
    public Pista getByIpMaquina(String ip, int pracaId) {
        Criteria criteria = this.createCriteria(Pista.class);
        criteria.add(Restrictions.and(Restrictions.eq("praca.id", pracaId), Restrictions.eq("ipMaquina", ip)));
        List<Pista> lista = GenericsUtil.checkedList(criteria.list(), Pista.class);
        Pista p = null;
        
        if(lista!=null && !lista.isEmpty()){
            p = lista.get(0);
        }
        
        return p;
    }
    
}
