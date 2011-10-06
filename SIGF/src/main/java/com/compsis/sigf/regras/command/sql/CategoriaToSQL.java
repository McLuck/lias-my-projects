package com.compsis.sigf.regras.command.sql;

import com.compsis.sigf.domain.Campo;
import com.compsis.sigf.domain.Categoria;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.regras.command.Command;
import com.compsis.sigf.regras.command.PropertyRetriever;
import com.compsis.sigf.script.manager.ManagementScript;

/**
 *
 * @author Lucas Israel
 */
public class CategoriaToSQL extends SQLInserts implements Command, PropertyRetriever{
    public CategoriaToSQL(Tabela tab, int vid, Concessionaria c){
        super(tab);
        conc = c;
        this.vid = vid;
    }
    private Concessionaria conc;
    private int vid;
    
    @Override
    public void execute() {
        for(Categoria cat : conc.getCategorias()){
            if(cat!=null){
                Tabela tbl = (Tabela) modelo.replicate(null);
                for(Campo cp : tbl.getCampos()){
                    if(cp!=null){
                        if(cp.getNome().toLowerCase().trim().equals("IdCategoria")){
                            
                        }
                    }
                }
            }
        }
    }

    @Override
    public String getPropertyName() {
        return "";
    }

    @Override
    public Object getPropertyValue() {
        return ManagementScript.getInstance().export(tabelas);
    }
    
}
