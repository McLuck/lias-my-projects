package com.compsis.sigf.domain.relatorio;

import com.compsis.sigf.domain.Relatorio;
import com.compsis.sigf.domain.RelatorioConcessionaria;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lucas Israel
 */
public class RelatorioMerge {
    private List<Relatorio> relatorios;
    private List<RelatorioConcessionaria> relatorioConcessionaria;
    public RelatorioMerge(List<Relatorio> disponiveis, List<RelatorioConcessionaria> utilizados){
        this.relatorioConcessionaria = utilizados;
        this.relatorios = disponiveis;
    }
    
    public List<RelatorioView> merge(){
        List<RelatorioView> relatorioView = new ArrayList<RelatorioView>();
        for(Relatorio r : relatorios){
            RelatorioView rv = new RelatorioView();
            rv.setRelatorio(r);
            rv.setAtivo(utilizando(r));
            relatorioView.add(rv);
        }
        return relatorioView;
    }
    
    private boolean utilizando(Relatorio r){
        for(RelatorioConcessionaria rc : relatorioConcessionaria){
            if(rc.getRelatorio().equals(r)){
                return true;
            }
        }
        return false;
    }
}
