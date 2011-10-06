package com.compsis.sigf.dao;

import com.compsis.sigf.dao.interfaces.PracaInterfaceDAO;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Praca;
import com.compsis.sigf.domain.PracaMeioPagamento;
import com.compsis.sigf.utils.GenericsUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Lucas Israel
 */
public class PracaDAO extends BaseDAO<Praca> implements PracaInterfaceDAO {

    private PracaDAO() {
        super(Praca.class);
    }
    
    private static PracaDAO dao;
    public static PracaDAO getInstance(){
        if(dao == null){
            dao = new PracaDAO();
        }
        return dao;
    }

    @Override
    public Praca getByCnpj(String cnpj) {
        Criteria criteria = this.createCriteria(Praca.class);
        criteria.add(Restrictions.eq("cnpj", cnpj));
        List<Praca> lista = GenericsUtil.checkedList(criteria.list(), Praca.class);
        Praca prac = null;
        if (lista != null && !lista.isEmpty()) {
            prac = lista.get(0);
        }
        return prac;
    }

    @Override
    public List<Praca> getByConcessionaria(int concessionariaID) {
        Criteria criteria = this.createCriteria(Praca.class);
        criteria.add(Restrictions.eq("concessionaria.id", concessionariaID));
        return GenericsUtil.checkedList(criteria.list(), Praca.class);
    }

    @Override
    public Praca getByNome(int concessionariaId, String nomePraca) {
        Criteria criteria = this.createCriteria(Praca.class);
        criteria.add(Restrictions.eq("nome", nomePraca));
        List<Praca> lista = GenericsUtil.checkedList(criteria.list(), Praca.class);
        Praca prac = null;
        if (lista != null && !lista.isEmpty()) {
            prac = lista.get(0);
        }
        return prac;
    }

    public Praca getByIDAndMeioPgto(int pracaID, int idMeioPgto) {
        Criteria criteria = this.createCriteria(PracaMeioPagamento.class);
        criteria.add(
                Restrictions.and(
                Restrictions.eq("praca.id", pracaID),
                Restrictions.eq("meioPagto.id", idMeioPgto)));

        List<PracaMeioPagamento> lista = GenericsUtil.checkedList(criteria.list(), PracaMeioPagamento.class);


        if (lista == null || lista.isEmpty()) {
            return null;
        }
        Praca prc = null;
        for (PracaMeioPagamento pmp : lista) {
            if (pmp != null) {
                prc = pmp.getPraca();
                break;
            }
        }
        return prc;
    }
}
