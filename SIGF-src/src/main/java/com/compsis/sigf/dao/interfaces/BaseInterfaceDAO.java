package com.compsis.sigf.dao.interfaces;


import com.compsis.sigf.domain.DomainObject;

import java.util.List;


/**
 *
 * @author Lucas Israel
 * @version 1.0
 *
 */
public interface BaseInterfaceDAO<T extends DomainObject> {

    /** Quantidade de registros por paginacao */
    Integer QTD_REGISTROS_PAGINA = 9;

    /**
     * Atualiza um objeto na base de dados.
     * 
     * @param obj objeto persistente a atualizar
     */
    void atualizar(T obj);
    
    /**
     * Commit
     */
    void commit();

    /**
     * Apaga um objeto na base de dados.
     * 
     * @param obj objeto persistente a apagar
     */
    void excluir(T obj);

    /**
     * Recupera um objeto a partir da sua chave primaria.
     * 
     * @param pk chave primaria do objeto persistente
     * 
     * @return objeto recuperado
     */
    T obter(Integer pk);

    /**
     * Recupera um objeto a partir da sua chave primaria. <br />
     * obs: o objeto recuperado sera a partir de uma sessao nova do hibernate, ignorando as alteracoes j�
     * feitas no objeto da sessao atual
     * 
     * @param pk chave primaria do objeto persistente
     * 
     * @return objeto recuperado
     */
    T obterAntigo(Integer pk);

    /**
     * Recupera todos os objetos.
     * 
     * @return um {@link List} de {@link DomainObject}
     */
    List<T> obterTodos();
}
