package com.compsis.sigf.dao;

import com.compsis.sigf.domain.Concessionaria;
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
public class FuncionalidadeConcessionariaDAO extends BaseDAO<FuncionalidadeConcessionaria> {

    private FuncionalidadeConcessionariaDAO() {
        super(FuncionalidadeConcessionaria.class);
    }
    
    private static FuncionalidadeConcessionariaDAO dao;
    public static FuncionalidadeConcessionariaDAO getInstance(){
        if(dao == null){
            dao = new FuncionalidadeConcessionariaDAO();
        }
        return dao;
    }
    
    public void deletar(FuncionalidadeConcessionaria fc){
        getSession().getTransaction().begin();
        getSession().delete(fc);
    }

    public void SalvarTudo(List<FuncionalidadeConcessionaria> recebidos, int concId) {
        ConcessionariaDAO cdao = (ConcessionariaDAO) AFactoryDao.getInstance(ConcessionariaDAO.class);
        Concessionaria conc = cdao.obter(concId);
        
        getSession().getTransaction().begin();
        
        //Apaga Funcionalidades desmarcadas
        Set<FuncionalidadeConcessionaria> aux = new HashSet<FuncionalidadeConcessionaria>();
        for(FuncionalidadeConcessionaria rc : conc.getFuncionalidades()){
            if(rc!=null && !existRecebidos(recebidos, rc)){
                aux.add(rc);
            }
        }
        
        for(FuncionalidadeConcessionaria rc : aux){
            conc.getFuncionalidades().remove(rc);
        }
        
        
        //Salva
        for(FuncionalidadeConcessionaria rc : recebidos){
            if(rc!=null && !exist(conc, rc)){
                rc.setConcessionaria(conc);
                conc.getFuncionalidades().add(rc);
            }
        }
        
        cdao.salvar(conc);
        cdao.commit();
        
        cdao.clear();
        cdao.close();
        cdao.clear();       
    }

    private boolean exist(Concessionaria conc, FuncionalidadeConcessionaria rel) {
        for (FuncionalidadeConcessionaria c : conc.getFuncionalidades()) {
            if (c!=null && c.getFuncionalidade().getId() == rel.getId()) {
                return true;
            }
        }
        return false;
    }
    
    public FuncionalidadeConcessionaria getByFuncionalidade(Concessionaria conc, int idFuncionalidade){
        getSession().getTransaction().begin();
        Criteria criteria = createCriteria(FuncionalidadeConcessionaria.class);
        criteria.add(Restrictions.and(Restrictions.eq("concessionaria.id", conc.getId()), Restrictions.eq("funcionalidade.id", idFuncionalidade)));
        FuncionalidadeConcessionaria fc = null;
        List<FuncionalidadeConcessionaria> list = GenericsUtil.checkedList(criteria.list(), FuncionalidadeConcessionaria.class);
        if(list!=null && !list.isEmpty()){
            fc = list.get(0);
        }
        return fc;
    }

    private boolean existRecebidos(List<FuncionalidadeConcessionaria> lista, FuncionalidadeConcessionaria rel) {
        for (FuncionalidadeConcessionaria c : lista) {
            if (c.getFuncionalidade().getId() == rel.getId()) {
                return true;
            }
        }
        return false;
    }

    public List<FuncionalidadeConcessionaria> getByConcessionaria(int concessionariaId) {
        Criteria criteria = this.createCriteria(FuncionalidadeConcessionaria.class);
        criteria.add(Restrictions.eq("concessionaria.id", concessionariaId));
        return GenericsUtil.checkedList(criteria.list(), FuncionalidadeConcessionaria.class);
    }

    public List<FuncionalidadeConcessionaria> getByConcessionaria(Concessionaria con) {
        return getByConcessionaria(con.getId());
    }
}
