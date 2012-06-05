package com.compsis.sigf.dao;

import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.RelatorioConcessionaria;
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
public class RelatorioConcessionariaDAO extends BaseDAO<RelatorioConcessionaria> {

    private RelatorioConcessionariaDAO() {
        super(RelatorioConcessionaria.class);
    }
    
    private static RelatorioConcessionariaDAO dao;
    public static RelatorioConcessionariaDAO getInstance() {
        if (dao == null) {
            dao = new RelatorioConcessionariaDAO();
        }
        return dao;
    }

    public void SalvarTudo(List<RelatorioConcessionaria> recebidos, int concId) {
        ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
        Concessionaria conc = cdao.obter(concId);
        
        getSession().getTransaction().begin();
        
        //Apaga os relatorios desmarcados
        Set<RelatorioConcessionaria> aux = new HashSet<RelatorioConcessionaria>();
        for(RelatorioConcessionaria rc : conc.getRelatorios()){
            if(rc!=null && !existRecebidos(recebidos, rc)){
                aux.add(rc);
            }
        }
        
        for(RelatorioConcessionaria rc : aux){
            conc.getRelatorios().remove(rc);
        }
        
        
        //Salva
        for(RelatorioConcessionaria rc : recebidos){
            if(rc!=null && !exist(conc, rc)){
                rc.setConcessionaria(conc);
                conc.getRelatorios().add(rc);
            }
        }
        
        cdao.salvar(conc);
        cdao.commit();
        
        cdao.clear();
        cdao.close();
        cdao.clear();       
    }

    private boolean exist(Concessionaria conc, RelatorioConcessionaria rel) {
        for (RelatorioConcessionaria c : conc.getRelatorios()) {
            if (c!=null && c.getRelatorio().getId() == rel.getId()) {
                return true;
            }
        }
        return false;
    }

    private boolean existRecebidos(List<RelatorioConcessionaria> lista, RelatorioConcessionaria rel) {
        for (RelatorioConcessionaria c : lista) {
            if (c.getRelatorio().getId() == rel.getId()) {
                return true;
            }
        }
        return false;
    }

    public List<RelatorioConcessionaria> getByConcessionaria(int concessionariaId) {
        Criteria criteria = this.createCriteria(RelatorioConcessionaria.class);
        criteria.add(Restrictions.eq("concessionaria.id", concessionariaId));
        return GenericsUtil.checkedList(criteria.list(), RelatorioConcessionaria.class);
    }
    
    public RelatorioConcessionaria getByRelatorio(int concessionariaId, int relatorioId) {
    	Criteria criteria = this.createCriteria(RelatorioConcessionaria.class);
    	criteria.add(Restrictions.and(Restrictions.eq("concessionaria.id", concessionariaId), Restrictions.eq("relatorio.id", relatorioId)));
    	List<RelatorioConcessionaria> test= GenericsUtil.checkedList(criteria.list(), RelatorioConcessionaria.class);
    	if(test!=null && !test.isEmpty()){
    		return test.get(0);
    	}
    	return null;
    }

    public List<RelatorioConcessionaria> getByConcessionaria(Concessionaria con) {
        return getByConcessionaria(con.getId());
    }
}
