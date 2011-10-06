package com.compsis.sigf.dao.interfaces;

import com.compsis.sigf.domain.Praca;

import java.util.List;

/**
 *
 * @author Lucas Israel
 */
public interface PracaInterfaceDAO extends BaseInterfaceDAO<Praca> {
    public Praca getByCnpj(String cnpj);
    public List<Praca> getByConcessionaria(int concessionariaID);
    public Praca getByNome(int concessionariaId, String nomePraca);
}
