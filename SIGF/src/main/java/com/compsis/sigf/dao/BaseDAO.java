package com.compsis.sigf.dao;

import com.compsis.sigf.dao.interfaces.BaseInterfaceDAO;
import com.compsis.sigf.domain.DomainObject;
import com.compsis.sigf.log.L;
import com.compsis.sigf.utils.GenericsUtil;
import java.io.Serializable;
import java.util.Calendar;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import org.hibernate.CacheMode;
import org.hibernate.Criteria;
import org.hibernate.FlushMode;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.hibernate.criterion.Order;

/**
 *
 * @author Lucas Israel
 */
public abstract class BaseDAO<T extends DomainObject> implements BaseInterfaceDAO<T> {
    protected String TAG = "DAO";
    private Class<T> domainObject;
    protected HB hibernateUtil;
    protected boolean isLOGGING = false;
    protected boolean isEvit = false;
    protected boolean isCacheble = true;
    
    public void setChache(boolean cacheble){
    	isCacheble = cacheble;
    }

    public static void Deletar(DomainObject delete) {
        HB hb = HB.getInstancia();
        Session s = (Session) hb.getNewSession();
        s.getTransaction().begin();
        s.delete(delete);
        s.getTransaction().commit();
        s.flush();
        s.clear();
        s.close();
    }

    @Override
    public void commit() {
        try {
            L.d(TAG, "Commit");
            getSession().getTransaction().commit();
        } catch (Exception e) {
        }
    }

    public void clear() {
        try {
            long inicio = Calendar.getInstance().getTimeInMillis();
            L.d(TAG, "Session Clear iniciado");
            getSession().clear();
            System.gc();
            long fim = Calendar.getInstance().getTimeInMillis();
            L.d(TAG,"Clear finalizado em "+((fim-inicio)/1000)+" seg(s).");
        } catch (Exception e) {
        }
    }

    public void setEvit(boolean evit) {
        isEvit = evit;
    }

    /**
     * Cria uma nova instancia do tipo {@link BaseDAO}.
     *
     * @param domainObject classe utilizada
     */
    protected BaseDAO(Class<T> domainObject) {
        this.domainObject = domainObject;
        this.hibernateUtil = HB.getInstancia();
    }
    
    public void close() {
        L.d(TAG, "Close Session.");
        try {
            getSession().getTransaction().commit();
        } catch (Exception ex) {
        }
        try {
            getSession().flush();
        } catch (Exception ex) {
        }
        try {
            getSession().close();
        } catch (Exception ex) {
        }
    }

    /**
     * {@inheritDoc}
     */
    public void atualizar(T obj) {
        L.d(TAG, "Atualizar");
        this.getSession().flush();
        this.getSession().clear();
        this.getSession().merge(obj);
        //this.getSession().update(obj);
        this.getSession().flush();
    }

    /**
     * {@inheritDoc}
     */
    public void excluir(T obj) {
    	getSession().getTransaction().begin();
        L.d(TAG, "Delete");
        this.getSession().delete(obj);
        this.getSession().flush();
    }

    /**
     * {@inheritDoc}
     */
    public T obter(Integer pk) {
        return this.domainObject.cast(this.getSession().get(this.domainObject, pk));
    }

    /**
     * {@inheritDoc}
     */
    public T obterAntigo(Integer pk) {
        return this.domainObject.cast(this.hibernateUtil.getNewSession().get(this.domainObject, pk));
    }

    /**
     * {@inheritDoc}
     */
    public List<T> obterTodos() {
        Criteria criteria = this.createCriteria(this.domainObject);
        Order order = this.getOrdemLista();
        if (order != null) {
            criteria.addOrder(order);
        }
        return GenericsUtil.checkedList(criteria.list(), this.domainObject);
    }

    /**
     * {@inheritDoc}
     */
    public Object salvar(T obj) {
        if (isEvit) {
            getSession().evict(obj);
            getSession().setCacheMode(CacheMode.IGNORE);
        }
        /*if (obj.getId() != 0) {
        atualizar(obj);
        return obj;
        }*/

        this.getSession().getTransaction().begin();
        //Object o = this.getSession().merge(obj);
        Object o = getSession().merge(obj);

        //this.getSession().flush();
        return o;
    }

    /**
     * Atribui o utilitario {@link HibernateUtil}.
     *
     * @param hibernateUtil {@link HibernateUtil}
     */
    public void setHibernateUtil(HB hibernateUtil) {
        this.hibernateUtil = hibernateUtil;
    }


    /**
     * Adiciona paginacoo a consulta.
     *
     * @param criteria criteria da consulta
     * @param paginaAtual numero da pagina atual
     * @param maximoRegistros maximo de registros da pagina
     */
    protected void adicionarPaginacao(Criteria criteria, Integer paginaAtual, int maximoRegistros) {
        if (paginaAtual != null) {
            criteria.setFirstResult(paginaAtual.intValue() * maximoRegistros);
        }
        criteria.setMaxResults(maximoRegistros);
    }

    /**
     * Cria um {@link Criteria} para a classe informada.
     *
     * @param clazz classe a criar o criteria
     * @return criteria da classe
     */
    protected Criteria createCriteria(Class<? extends Serializable> clazz) {
        return this.getSession().createCriteria(clazz);
    }

    /**
     * Cria um {@link Criteria} para a classe informada.
     *
     * @param clazz classe a criar o criteria
     * @param alias alias para o objeto
     * @return criteria da classe
     */
    protected Criteria createCriteria(Class<? extends Serializable> clazz, String alias) {
        return this.getSession().createCriteria(clazz, alias);
    }

    /**
     * Recupera a ordenacao padrao do metodo {@link #obterTodos()}.
     *
     * @return ordenacao padrao
     */
    protected Order getOrdemLista() {
        return null;
    }

    /**
     * Recupera sessao atual do hibernate.
     *
     * @return session sessao atual
     */
    protected Session getSession() {
        //return ((Session) hibernateUtil.getNewSession());
        if(!isCacheble){
        	Session s = (Session)hibernateUtil.getNewSession();
            s.setCacheMode(CacheMode.REFRESH);
            s.setFlushMode(FlushMode.ALWAYS);
            return s;
        }else{
//        	return ((Session) hibernateUtil.getNewSession());
        	Session s = (Session)hibernateUtil.getNewSession();
            s.setCacheMode(CacheMode.NORMAL);
            s.setFlushMode(FlushMode.AUTO);
            return s;
        }
    	
        //return this.sessionFactory.getCurrentSession();
    }
}
