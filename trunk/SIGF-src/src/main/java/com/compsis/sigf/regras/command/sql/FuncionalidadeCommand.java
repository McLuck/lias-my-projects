/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.compsis.sigf.regras.command.sql;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.TabelaDAO;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.FuncionalidadeConcessionaria;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.regras.command.Command;
import com.compsis.sigf.regras.command.PropertyRetriever;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author lamancio
 */
public class FuncionalidadeCommand extends SQLInserts implements Command, PropertyRetriever {

    public FuncionalidadeCommand(Tabela modelo, Concessionaria c, int vid) {
        super(modelo);
        conc = c;
        this.vid = vid;
    }
    private Concessionaria conc;
    private int vid;
    private TabelaDAO tdao = (TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);

    @Override
    public void execute() {

        tabelas = new ArrayList<Tabela>();
        //Funcionalidades que sempre vao existir (TOTAL MENOS AREA DE VENDAS)
        List<Tabela> padroes = tdao.test4(vid);
        tdao.close();
        tdao.clear();
        tabelas.addAll(padroes);

        StringBuffer sb = new StringBuffer();
        for (FuncionalidadeConcessionaria fc : conc.getFuncionalidades()) {
            if (fc != null) {
                if (!fc.getFuncionalidade().getFuncionalidades().trim().toLowerCase().equals("na")) {
                    if (sb.length() > 0) {
                        sb.append(",");
                    }
                    sb.append(fc.getFuncionalidade().getFuncionalidades());
                }
            }
        }
        List<Tabela> temp = tdao.getFuncionalidadesIN(vid, sb.toString());
        if (temp != null) {
            tabelas.addAll(temp);
        }
        temp = null;
        Collections.sort(tabelas);

        tdao.close();
        tdao.clear();
    }

    @Override
    public String getPropertyName() {
        return "";
    }

    @Override
    public Object getPropertyValue() {
        return tabelas;
    }
}
