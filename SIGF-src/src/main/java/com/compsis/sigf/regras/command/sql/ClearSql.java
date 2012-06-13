package com.compsis.sigf.regras.command.sql;

import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.log.L;
import com.compsis.sigf.regras.command.Command;
import com.compsis.sigf.regras.command.GeralConverte;
import com.compsis.sigf.regras.command.PropertyRetriever;
import com.compsis.sigf.utils.UtilidadesGenericas;

import java.util.Set;
import java.util.TreeSet;

/**
 *
 * @author Lucas Israel
 */
public class ClearSql extends SQLInserts implements Command, PropertyRetriever {
    
    public ClearSql(Tabela modelo, Concessionaria conc, String scripts){
        super(modelo);
        this.conc = conc;
        this.script = scripts;
    }
    private StringBuffer sb = new StringBuffer();
    private String script;
    private Concessionaria conc;
    private Set<String> unificados;
    @Override
    public void execute() {
        unificados = new TreeSet<String>();
        L.d(this.getClass().getName() , "Tratando limpeza de SQL e estruturando script...");
        System.gc();
        String idOrigemConc = String.valueOf(GeralConverte.IDS.GET_ID_CONCESSIONARIA(conc));
        script = script.replace("#concorigem#", idOrigemConc);
        script = script.replace("#IDCATESP#", String.valueOf(UtilidadesGenericas.getCatEsp(conc.getCategorias()).getCatid()));
        script = script.replace("insert", "INSERT");
        String[] inserts = script.split("INSERT");
        for(String sc : inserts){
            //if(sc.trim().isEmpty() || !sc.toLowerCase().trim().startsWith("into"))continue;
            String aux = sc.replace(" ", "").toLowerCase();
            if(!aux.isEmpty() && unificados.add(aux) && !aux.contains("#"))
                sb.append("INSERT ").append(sc).append(UtilidadesGenericas.LINE_BREAK);
        }
        
        
        
        
        /*
         * APPEND SCRIPTS POS INSERTS
         */
        
        String aux = sb.toString();
        
        //Padroniza data
        aux = aux.replace("trunc(sysdate)", "dbo.trunc_date(getDate())");
        aux = aux.replace("sysdate", "dbo.trunc_date(getDate())");

        //Remove Itens que faltam ser implementados
        aux = aux.replace("INSERT  INTO papelfuncionalidade (idpapel, idfuncionalidade, datainsercao) VALUES (0, 1083, dbo.trunc_date(getDate()));", "");
        aux = aux.replace("INSERT  INTO papelfuncionalidade (idpapel, idfuncionalidade, datainsercao) VALUES (0, 1097, dbo.trunc_date(getDate()));", "");
        aux = aux.replace("INSERT  INTO papelfuncionalidade (idpapel, idfuncionalidade, datainsercao) VALUES (0, 1096, dbo.trunc_date(getDate()));", "");
        aux = aux.replace("INSERT  INTO papelfuncionalidade (idpapel, idfuncionalidade, datainsercao) VALUES (0, 1089, dbo.trunc_date(getDate()));", "");
        aux = aux.replace("INSERT  INTO papelfuncionalidade (idpapel, idfuncionalidade, datainsercao) VALUES (0, 1091, dbo.trunc_date(getDate()));", "");
        aux = aux.replace("INSERT  INTO papelfuncionalidade (idpapel, idfuncionalidade, datainsercao) VALUES (0, 1090, dbo.trunc_date(getDate()));", "");
        aux = aux.replace("INSERT  INTO papelfuncionalidade (idpapel, idfuncionalidade, datainsercao) VALUES (0, 1093, dbo.trunc_date(getDate()));", "");
        aux = aux.replace("INSERT  INTO papelfuncionalidade (idpapel, idfuncionalidade, datainsercao) VALUES (0, 1092, dbo.trunc_date(getDate()));", "");
        aux = aux.replace("INSERT  INTO papelfuncionalidade (idpapel, idfuncionalidade, datainsercao) VALUES (0, 1095, dbo.trunc_date(getDate()));", "");
        aux = aux.replace("INSERT  INTO papelfuncionalidade (idpapel, idfuncionalidade, datainsercao) VALUES (0, 1094, dbo.trunc_date(getDate()));", "");
        
        
        
        sb.setLength(0);
        sb.append(aux);
        
        
        L.d(this.getClass().getName() , "SQL foi tratado com sucesso!");
    }

    @Override
    public String getPropertyName() {
        return "";
    }

    @Override
    public Object getPropertyValue() {
        return UtilidadesGenericas.getCabecalhoScripts(conc).concat(sb.toString());
    }
    
}
