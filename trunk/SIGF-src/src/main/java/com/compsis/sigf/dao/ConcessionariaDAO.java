package com.compsis.sigf.dao;

import com.compsis.sigf.dao.interfaces.ConcessionariaInterfaceDAO;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Praca;
import com.compsis.sigf.utils.GenericsUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Lucas Israel
 */
public class ConcessionariaDAO extends BaseDAO<Concessionaria> implements ConcessionariaInterfaceDAO {

    private ConcessionariaDAO() {
        super(Concessionaria.class);
    }
    
    private static ConcessionariaDAO dao;
    public static ConcessionariaDAO getInstance(){
        if(dao == null){
            dao = new ConcessionariaDAO();
        }
        return dao;
    }

    @Override
    public List<Concessionaria> getByNome(String nome) {
        Criteria criteria = this.createCriteria(Concessionaria.class);
        criteria.add(Restrictions.like("nome", nome));
        return GenericsUtil.checkedList(criteria.list(), Concessionaria.class);
    }

    @Override
    public Concessionaria getByCNPJ(String cnpj) {
        Criteria criteria = this.createCriteria(Concessionaria.class);
        criteria.add(Restrictions.eq("cnpj", cnpj));
        List<Concessionaria> lista = GenericsUtil.checkedList(criteria.list(), Concessionaria.class);
        Concessionaria c = null;
        if (lista != null && !lista.isEmpty()) {
            c = lista.get(0);
        }
        return c;
    }

    @Override
    public Concessionaria getByNumeroCliente(int numeroCli) {
        Criteria criteria = this.createCriteria(Concessionaria.class);
        criteria.add(Restrictions.eq("numeroCliente", numeroCli));
        List<Concessionaria> lista = GenericsUtil.checkedList(criteria.list(), Concessionaria.class);
        Concessionaria c = null;
        if (lista != null && !lista.isEmpty()) {
            c = lista.get(0);
        }
        return c;
    }

    @Override
    public List<Concessionaria> getByNomePraca(String pracaNome) {
        Criteria criteria = this.createCriteria(Praca.class);
        criteria.add(Restrictions.like("nome", pracaNome));
        List<Praca> lista = GenericsUtil.checkedList(criteria.list(), Praca.class);
        List<Concessionaria> listaC = new ArrayList<Concessionaria>();
        if (lista != null && !lista.isEmpty()) {
            for (Praca p : lista) {
                listaC.add(p.getConcessionaria());
            }
        }
        return listaC;
    }

    @Override
    public List<Concessionaria> getByPais(int pais) {
        Criteria criteria = this.createCriteria(Concessionaria.class);
        criteria.add(Restrictions.like("numeroPais", pais));
        return GenericsUtil.checkedList(criteria.list(), Concessionaria.class);
    }

    @Override
    public Concessionaria getByArrecadacao(int idArrecadacao) {
        Criteria criteria = this.createCriteria(Praca.class);
        criteria.add(Restrictions.like("configArrecadacao.id", idArrecadacao));
        List<Concessionaria> lista = GenericsUtil.checkedList(criteria.list(), Concessionaria.class);
        Concessionaria c = null;
        if (lista != null && !lista.isEmpty()) {
            c = lista.get(0);
        }
        return c;
    }
}
