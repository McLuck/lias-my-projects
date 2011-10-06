package com.compsis.sigf.domain;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.TabelaDAO;
import com.compsis.sigf.script.manager.ManagementScript;
import java.util.List;

/**
 *
 * @author Lucas Israel
 */
public class FuncionalidadeAcesso extends DomainObject implements Replicable, SqlInterface{
    private int idFuncionalidade;
    private String acesso, acessoMetodo;
    private int nivelPorMetodo;

    

    /**
     * @return the acesso
     */
    public String getAcesso() {
        return acesso;
    }

    /**
     * @param acesso the acesso to set
     */
    public void setAcesso(String acesso) {
        this.acesso = acesso;
    }

    /**
     * @return the acessoMetodo
     */
    public String getAcessoMetodo() {
        return acessoMetodo;
    }

    /**
     * @param acessoMetodo the acessoMetodo to set
     */
    public void setAcessoMetodo(String acessoMetodo) {
        this.acessoMetodo = acessoMetodo;
    }

    /**
     * @return the nivelPorMetodo
     */
    public int getNivelPorMetodo() {
        return nivelPorMetodo;
    }

    /**
     * @param nivelPorMetodo the nivelPorMetodo to set
     */
    public void setNivelPorMetodo(int nivelPorMetodo) {
        this.nivelPorMetodo = nivelPorMetodo;
    }

    @Override
    public Replicable replicate(Object o) {
        FuncionalidadeAcesso f = new FuncionalidadeAcesso();
        f.setId(null);
        f.setAcesso(acesso);
        f.setAcessoMetodo(acessoMetodo);
        f.setNivelPorMetodo(nivelPorMetodo);
        f.setIdFuncionalidade(idFuncionalidade);
        return f;
    }

    @Override
    public String toSqlInsert(Versao v) {
        TabelaDAO tdao = (TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);
        List<Tabela> tlista = tdao.getTabelas(v.getId(), "funcionalidadeacesso", "idfuncionalidade", String.valueOf(idFuncionalidade));
        String script = ManagementScript.getInstance().export(tlista);
        tdao.close();
        tdao.clear();
        return script;
    }

    /**
     * @return the idFuncionalidade
     */
    public int getIdFuncionalidade() {
        return idFuncionalidade;
    }

    /**
     * @param idFuncionalidade the idFuncionalidade to set
     */
    public void setIdFuncionalidade(int idFuncionalidade) {
        this.idFuncionalidade = idFuncionalidade;
    }
}
