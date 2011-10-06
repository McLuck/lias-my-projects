package com.compsis.sigf.dao;

import com.compsis.sigf.log.L;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author Lucas Israel
 */
public class AFactoryDao {
    private AFactoryDao(){}
    private static Map<String, BaseDAO> mapa = null;
    
    public static BaseDAO getInstance(String daoName){
        if(mapa==null){
            load();
        }
        return mapa.get(daoName);
    }
    public static  BaseDAO getInstance(Class classDao){
        return getInstance(classDao.getName());
    }
    
    private static void load(){
        L.d(AFactoryDao.class.getName() , "Carregando DAOS...");
        mapa = new HashMap<String, BaseDAO>();
        mapa.put(AntenaPistaDAO.class.getName(), AntenaPistaDAO.getInstance());
        mapa.put(ArrecadacaoDAO.class.getName(), ArrecadacaoDAO.getInstance());
        mapa.put(CampoDAO.class.getName(), CampoDAO.getInstance());
        mapa.put(CategoriaDAO.class.getName(), CategoriaDAO.getInstance());
        mapa.put(ConcessionariaDAO.class.getName(), ConcessionariaDAO.getInstance());
        mapa.put(ConfigAcessoDAO.class.getName(), ConfigAcessoDAO.getInstance());
        mapa.put(ConfiguracaoImagemDAO.class.getName(), ConfiguracaoImagemDAO.getInstance());
        mapa.put(ConfiguracaoPracaDAO.class.getName(), ConfiguracaoPracaDAO.getInstance());
        mapa.put(FuncionalidadeAcessoDAO.class.getName(), FuncionalidadeAcessoDAO.getInstance());
        mapa.put(FuncionalidadeConcessionariaDAO.class.getName(), FuncionalidadeConcessionariaDAO.getInstance());
        mapa.put(FuncionalidadeDAO.class.getName(), FuncionalidadeDAO.getInstance());
        mapa.put(InsertDAO.class.getName(), InsertDAO.getInstance());
        mapa.put(MeioPagamentoDAO.class.getName(), MeioPagamentoDAO.getInstance());
        mapa.put(PapelFuncionalidadeDAO.class.getName(), PapelFuncionalidadeDAO.getInstance());
        mapa.put(PistaDAO.class.getName(), PistaDAO.getInstance());
        mapa.put(PracaDAO.class.getName(), PracaDAO.getInstance());
        mapa.put(PracaMeioPagamentoDAO.class.getName(), PracaMeioPagamentoDAO.getInstance());
        mapa.put(RelatorioConcessionariaDAO.class.getName(), RelatorioConcessionariaDAO.getInstance());
        mapa.put(RelatorioDAO.class.getName(), RelatorioDAO.getInstance());
        mapa.put(ServidorBDDAO.class.getName(), ServidorBDDAO.getInstance());
        mapa.put(TabelaDAO.class.getName(), TabelaDAO.getInstance());
        mapa.put(TipoPistaDAO.class.getName(), TipoPistaDAO.getInstance());
        mapa.put(VersaoDAO.class.getName(), VersaoDAO.getInstance());
        L.d(AFactoryDao.class.getName() , "DAOS Carregados em memoria.");
    }
    
    public static void CLOSE_ALL_CONNECTIONS(){
        L.d(AFactoryDao.class.getName() , "FECHANDO TODAS SESSOES ABERTAS...");
        if(mapa!=null){
            Set<String> keys = mapa.keySet();
            for(String s : keys){
                mapa.get(s).close();
            }
        }
    }
    public static void CLEAR_ALL(){
        L.d(AFactoryDao.class.getName() , "Impando CACHE...");
        if(mapa!=null){
            Set<String> keys = mapa.keySet();
            for(String s : keys){
                mapa.get(s).clear();
            }
        }
        L.d(AFactoryDao.class.getName() , "Limpeza do CACHE termnada...");
    }
}
