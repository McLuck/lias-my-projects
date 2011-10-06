package com.compsis.sigf.domain;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.TabelaDAO;
import com.compsis.sigf.script.manager.ManagementScript;
import java.util.List;

/**
 *
 * @author Lucas Israel
 */
public class PapelFuncionalidade extends DomainObject implements Replicable, SqlInterface{
    private int idFuncionalidade;
    private int idpapel;

    /**
     * @return the idpapel
     */
    public int getIdpapel() {
        return idpapel;
    }

    /**
     * @param idpapel the idpapel to set
     */
    public void setIdpapel(int idpapel) {
        this.idpapel = idpapel;
    }

    @Override
    public Replicable replicate(Object o) {
        PapelFuncionalidade f  = new PapelFuncionalidade();
        f.setId(null);
        f.setIdFuncionalidade(idFuncionalidade);
        f.setIdpapel(idpapel);
        return f;
    }

    @Override
    public String toSqlInsert(Versao v) {
        TabelaDAO tdao = (TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);
        List<Tabela> tlist = tdao.getTabelas(v.getId(), "papelfuncionalidades", "valor", String.valueOf(idFuncionalidade));
        String script = ManagementScript.getInstance().export(tlist);
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
