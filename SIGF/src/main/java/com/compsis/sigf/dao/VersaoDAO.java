package com.compsis.sigf.dao;

import br.com.mcluck.asynchronously.annotation.Asynchronous;

import com.compsis.sigf.domain.Campo;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.domain.Versao;
import com.compsis.sigf.utils.GenericsUtil;
import java.util.List;
import org.hibernate.CacheMode;
import org.hibernate.Criteria;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Restrictions;


/**
 *
 * @author Lucas Israel
 */
public class VersaoDAO extends BaseDAO<Versao> {
    private VersaoDAO(){
        super(Versao.class);
    }
    
    private static VersaoDAO dao;
    public static VersaoDAO getInstance(){
        if(dao == null){
            dao = new VersaoDAO();
        }
        return dao;
    }
    
    @Override
    public Object salvar(Versao v){
        List<Versao> lista = getByVersao(v.getVersao());
        Versao v2;
        if(lista!=null && !lista.isEmpty()){
            v2 = lista.get(0);
            v2.setNome(v.getNome());
            return super.salvar(v2);
        }else{
             
            this.getSession().getTransaction().begin();
            if (isEvit) {
                getSession().evict(v);
                getSession().setCacheMode(CacheMode.IGNORE);
            }            
            //Object o = this.getSession().merge(obj);
            Object o = getSession().merge(v);
            //this.getSession().flush();
            return o;
        }
    }
    
    public void mesclarTabelasCampos(Versao v, List<Tabela> lista){
        TabelaDAO tdao = (TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);
        CampoDAO cpDAO = (CampoDAO) AFactoryDao.getInstance(CampoDAO.class);
        for(Tabela tbl : lista){
            Integer idexist = existTabela(tbl, v.getId());
            Tabela aux;
            if(idexist==0){
                tbl.setVersao(v);
                Object o = tdao.salvar(tbl);
                tdao.commit();
                if(o instanceof Tabela){
                    aux = (Tabela)o;
                }else if(o instanceof Integer){
                    tbl.setId((Integer)o);
                    aux = tbl;
                }
            }else{
                aux = tdao.obter(idexist);
                for(Campo cp : tbl.getCampos()){
                    if(cp!=null){
                        Integer testeCp = existCampo(cp, idexist);
                        if(testeCp == 0){
                            cp.setTabela(aux);
                            cpDAO.salvar(cp);
                            cpDAO.commit();
                        }
                    }
                }
            }
        }
    }
    
    private Integer existTabela(Tabela t, Integer vid){
        Criteria criteria = this.createCriteria(Tabela.class);
        criteria.add(Restrictions.and(Restrictions.eq("nome", t.getNome()), Restrictions.eq("versao.id", vid)));
        List<Tabela> lista = GenericsUtil.checkedList(criteria.list(), Tabela.class);
        return (lista != null && !lista.isEmpty())?lista.get(0).getId():0;
    }
    
    private Integer existCampo(Campo cp, Integer tid){
        Criteria criteria = this.createCriteria(Campo.class);
        criteria.add(Restrictions.and(Restrictions.eq("nome", cp.getNome()), Restrictions.eq("tabela.id", tid)));
        List<Campo> lista = GenericsUtil.checkedList(criteria.list(), Campo.class);
        return (lista != null && !lista.isEmpty())?lista.get(0).getId():0;
    }
    
    public List<Versao> getByVersao(Integer versao) {
        Criteria criteria = this.createCriteria(Versao.class);
        criteria.add(Restrictions.eq("versao", versao));
        return GenericsUtil.checkedList(criteria.list(), Versao.class);
    }
  
    
    public Object copiarTudo(Versao v){
        v = (Versao)v.replicate(null);
        clear();
        close();
        Session session = (Session) hibernateUtil.getNewSession();
        session.getTransaction().begin();
        session.evict(v);
        session.save(v) ;
        return v;
    }
    
    @Asynchronous
    public void apagar(Versao v){
        getSession().getTransaction().begin();
        getSession().delete(v);
    }
    
    @Asynchronous
    public void apagarTest1(Versao v){
        getSession().getTransaction().begin();
        
        List minTable = getSession().createSQLQuery("select min(id) from ttabela where versao_id = "+v.getId()).list();
        List maxTable = getSession().createSQLQuery("select max(id) from ttabela where versao_id = "+v.getId()).list();
        
        
        int minTab = 0;
        int maxTab = 0;
        int minCamp = 0;
        int maxCamp = 0;
        
        if(minTable!=null && !minTable.isEmpty()){
            minTab = (Integer) minTable.get(0);
        }
        if(maxTable!=null && !maxTable.isEmpty()){
            maxTab = (Integer) maxTable.get(0);
        }
        
        Tabela t = (Tabela) getSession().get(Tabela.class, minTab);
        
        List minCampo = getSession().createSQLQuery("select min(id) from tcampo where tabela_id = "+t.getId()).list();
        List maxCampo = getSession().createSQLQuery("select max(id) from tcampo where tabela_id = "+t.getId()).list();
        
        if(minCampo!=null && !minCampo.isEmpty()){
            minCamp = (Integer) minCampo.get(0);
        }
        if(maxCampo!=null && !maxCampo.isEmpty()){
            maxCamp = (Integer) maxCampo.get(0);
        }
        
        StringBuilder sb = new StringBuilder();
        sb.append("DELETE FROM tcampo WHERE id >= ");
        sb.append(minCamp);
        sb.append(" AND id <= ");
        sb.append(maxCamp);
        sb.append(";");
        
        getSession().createSQLQuery(sb.toString()).executeUpdate();
        
        sb = new StringBuilder();
        sb.append("DELETE FROM ttabela WHERE id >= ");
        sb.append(minTab);
        sb.append(" AND id <= ");
        sb.append(maxTab);
        sb.append(";");
        
        getSession().createSQLQuery(sb.toString()).executeUpdate();
        getSession().getTransaction().commit();
        getSession().clear();
        getSession().flush();
        
        getSession().evict(v);
        getSession().delete(v);
        getSession().clear();
        getSession().flush();
        getSession().close();
    }
  
}
