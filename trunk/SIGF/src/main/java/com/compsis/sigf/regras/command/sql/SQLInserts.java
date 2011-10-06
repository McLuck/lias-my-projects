package com.compsis.sigf.regras.command.sql;

import com.compsis.sigf.domain.Tabela;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lucas Israel
 */
public abstract class SQLInserts {
    public SQLInserts(Tabela modelo){
        this.modelo = modelo;
    }
    
    protected Tabela modelo;
    protected List<Tabela> tabelas;

    /**
     * @return the tabelas
     */
    public List<Tabela> getTabelas() {
        return tabelas;
    }

    /**
     * @param tabelas the tabelas to set
     */
    public void setTabelas(List<Tabela> tabelas) {
        this.tabelas = tabelas;
    }
}
