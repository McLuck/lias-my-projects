package com.compsis.sigf.utils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
/**
 *  Classe utilitaria para auxiliar a convers�o de objetos sem "generics" para objetos com
 * "generics".
 * <p>
 * Serve tambem para reduzir a quantidade de {@literal @SuppressWarnings("unchecked")} espalhados
 * pelo codigo-fonte, mantendo-os dentro desta classe.
 * </p>
 * 
 *
 */
@SuppressWarnings("unchecked")
public class GenericsUtil {

    /**
     * Construtor privado (classe utilit�ria).
     */
    private GenericsUtil() {
    }

    /**
     * Retorna uma cole��o do tipo {@link Collection} que usa "generics" a partir de uma cole��o que
     * n�o usa "generics".
     * 
     * @see Collections#checkedCollection(Collection, Class)
     * 
     * @param <T> O tipo dos elementos que a cole��o contem.
     * @param collection uma colecao com elementos do tipo T.
     * @param type a classe T correspondente.
     * @return colecao 'checked' correspondente a collection.
     */
    public static <T> Collection<T> checkedCollection(Collection collection, Class<T> type) {
        if (collection == null) {
            return null;
        }
        collection.removeAll(Collections.singleton(null)); 
        return Collections.checkedCollection(collection, type);
    }

    /**
     * Retorna um {@link Iterator} que usa "generics" a partir de um {@link Iterator} que n�o usa
     * "generics".
     * 
     * @param <T> o tipo dos elementos do iterator.
     * @param it o iterator com elementos do tipo T.
     * @param type a classe T correspondente.
     * @return iterator 'checked' correspondente a it.
     */
    public static <T> Iterator<T> checkedIterator(Iterator it, Class<T> type) {
        return new CheckedIterator(it, type);
    }

    /**
     * Retorna uma lista do tipo {@link List} que usa "generics" a partir de uma lista que n�o usa
     * "generics".
     * 
     * @see Collections#checkedList(List, Class)
     * 
     * @param <T> O tipo dos elementos que a lista cont�m.
     * @param list uma lista com elementos do tipo T
     * @param type a classe T correspondente
     * @return lista 'checked' correspondente a list
     */
    public static <T> List<T> checkedList(List list, Class<T> type) {
        List<T> lista=Collections.checkedList(list, type);
        List<T> aux = new ArrayList<T>();
        for(T t : lista){
            if(t!=null){
                aux.add(t);
            }
        }
        return aux;
    }
}
