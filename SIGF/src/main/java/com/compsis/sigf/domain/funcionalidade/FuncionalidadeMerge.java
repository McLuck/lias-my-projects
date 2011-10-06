package com.compsis.sigf.domain.funcionalidade;

import com.compsis.sigf.domain.Funcionalidade;
import com.compsis.sigf.domain.FuncionalidadeConcessionaria;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lucas Israel
 */
public class FuncionalidadeMerge {
    private List<Funcionalidade> funcionalidades;
    private List<FuncionalidadeConcessionaria> funcionalidadeConcessionaria;
    
    public FuncionalidadeMerge(List<Funcionalidade> disponiveis, List<FuncionalidadeConcessionaria> utilizados){
        this.funcionalidades = disponiveis;
        this.funcionalidadeConcessionaria = utilizados;
    }
    
    public List<FuncionalidadeView> merge(){
        List<FuncionalidadeView> lista = new ArrayList<FuncionalidadeView>();
        for(Funcionalidade f : funcionalidades){
            FuncionalidadeView fv = new FuncionalidadeView();
            fv.setFuncionalidade(f);
            fv.setAtivo(utilizado(f));
            lista.add(fv);
        }
        return lista;
    }
    
    private boolean utilizado(Funcionalidade f){
        for(FuncionalidadeConcessionaria fc : funcionalidadeConcessionaria){
            if(f.equals(fc.getFuncionalidade())){
                return true;
            }
        }
        return false;
    }
}
