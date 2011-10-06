package com.compsis.sigf.regras.command.sql;

import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.log.L;
import com.compsis.sigf.regras.command.Command;
import com.compsis.sigf.regras.command.GeralConverte;
import com.compsis.sigf.regras.command.PropertyRetriever;
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
        script = script.replace("insert", "INSERT");
        String[] inserts = script.split("INSERT");
        for(String sc : inserts){
            //if(sc.trim().isEmpty() || !sc.toLowerCase().trim().startsWith("into"))continue;
            String aux = sc.replace(" ", "").toLowerCase();
            if(!aux.isEmpty() && unificados.add(aux))
                sb.append("INSERT ").append(sc).append("\n");
            /*sc = "insert ".concat(sc).trim().concat("\n");
            if(!sb.toString().toLowerCase().contains(sc.toLowerCase()) && !sc.toLowerCase().contains("#"))
                sb.append(sc);*/
        }
        
        //APPEND INSERTS FINAIS
        sb.append("INSERT into perfilpapelfunc(idpapel, idfuncionalidade, idperfil, datainsercao)values(0, 1, 0, dbo.trunc_date(getDate()));");
        L.d(this.getClass().getName() , "SQL foi tratado com sucesso!");
    }

    @Override
    public String getPropertyName() {
        return "";
    }

    @Override
    public Object getPropertyValue() {
        return sb.toString();
    }
    
}
