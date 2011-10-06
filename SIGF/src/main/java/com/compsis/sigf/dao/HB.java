
package com.compsis.sigf.dao;


import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Lucas Israel
 */
public class HB {

    private static HB instancia = null;
    private SessionFactory sessionFactory;
    private final ThreadLocal<Session> sessionThread = new ThreadLocal<Session>();

    /**
     * Cria uma nova instancia do tipo {@link HibernateUtil}.
     */
    private HB() {
        //singleton
        try {
            // Create the SessionFactory from standard (hibernate.cfg.xml)
            // config file.
            
            //sessionFactory = new Configuration().configure().buildSessionFactory();

            sessionFactory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            // Log the exception.
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    /**
     * Recupera a �nica instancia de {@link HibernateUtil}.
     *
     * @return {@link HB}
     */
    public static HB getInstancia() {
        synchronized (HB.class) {
            if (instancia == null) {
                instancia = new HB();
            }
        }
        return instancia;
    }

    /**
     * Fecha a nova sessao criada do hibernate.
     */
    public void closeSession() {
        Session session = this.sessionThread.get();
        if ((session != null) && session.isOpen()) {
            this.sessionThread.set(null);
            session.close();
        }
    }

    /**
     * Recupera uma nova sessao criada do hibernate. <br />
     * obs: esta {@link Session}
     *
     * @return sessao criada
     */
    public Session getNewSession() {
        //recupera o objeto session do threadLocal
        Session session = this.sessionThread.get();
        //abre uma nova sess�o para a thread atual somente se a mesma estiver nula ou fechada
        if ((session == null) || !session.isOpen()) {
            session = getNewSessionFromFactory();
            this.sessionThread.set(session);
        }
        return session;
    }

    /**
     * Atribui a f�brica de sessoes do hibernate.
     *
     * @param sessionFactory fabrica de sess�es do hibernate
     */
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getNewSessionFromFactory() {
        return sessionFactory.openSession();
    }
}
