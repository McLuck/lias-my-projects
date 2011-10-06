package com.compsis.sigf.domain.funcionalidade;

import com.compsis.sigf.domain.Funcionalidade;

/**
 *
 * @author Lucas Israel
 */
public class FuncionalidadeView {
    private Funcionalidade funcionalidade;
    private boolean ativo;

    /**
     * @return the funcionalidade
     */
    public Funcionalidade getFuncionalidade() {
        return funcionalidade;
    }

    /**
     * @param funcionalidade the funcionalidade to set
     */
    public void setFuncionalidade(Funcionalidade funcionalidade) {
        this.funcionalidade = funcionalidade;
    }

    /**
     * @return the ativo
     */
    public boolean isAtivo() {
        return ativo;
    }

    /**
     * @param ativo the ativo to set
     */
    public void setAtivo(boolean ativo) {
        this.ativo = ativo;
    }
}
