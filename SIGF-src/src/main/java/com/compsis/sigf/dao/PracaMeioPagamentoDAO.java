package com.compsis.sigf.dao;

import com.compsis.sigf.domain.*;
import com.compsis.sigf.utils.GenericsUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.hql.ast.tree.RestrictableStatement;

/**
 *
 * @author Lucas Israel
 */
public class PracaMeioPagamentoDAO extends BaseDAO<PracaMeioPagamento> {

    private PracaMeioPagamentoDAO() {
        super(PracaMeioPagamento.class);
    }
    private static PracaMeioPagamentoDAO dao;
    public static PracaMeioPagamentoDAO getInstance() {
        if (dao == null) {
            dao = new PracaMeioPagamentoDAO();
        }
        return dao;
    }

    public PracaMeioPagamento getByPraca(int idPraca, int idMP) {
        Criteria criteria = createCriteria(PracaMeioPagamento.class);
        criteria.add(Restrictions.and(
                Restrictions.eq("praca.id", idPraca),
                Restrictions.eq("meioPagto.id", idMP)));
        List<PracaMeioPagamento> listaP = GenericsUtil.checkedList(criteria.list(), PracaMeioPagamento.class);
        PracaMeioPagamento pmp = null;
        if (listaP == null || listaP.isEmpty()) {
            return null;
        }
        for (PracaMeioPagamento pm : listaP) {
            if (pm != null) {
                pmp = pm;
                break;
            }
        }
        return pmp;
    }

    public void deleteAllPracasFromMP(int idMP, int idConc) {
        //select pm.* from praca_meio_pgto pm where pm.id_praca in (select p.id from praca p where concessionaria_id = '4');
        StringBuffer sb = new StringBuffer();
        sb.append("DELETE from praca_meio_pgto WHERE praca_meio_pgto.id_praca in (SELECT praca.id FROM praca WHERE praca.concessionaria_id = '");
        sb.append(idConc);
        sb.append("');");
        getSession().getTransaction().begin();

        getSession().createSQLQuery(sb.toString()).executeUpdate();
        commit();
        close();
        clear();
    }
}
