package com.compsis.sigf.dao.interfaces;

import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Praca;

import java.util.List;

/**
 *
 * @author Lucas Israel
 */
public interface ConcessionariaInterfaceDAO extends BaseInterfaceDAO<Concessionaria> {
    public List<Concessionaria>  getByNome(String nome);
    public Concessionaria getByCNPJ(String cnpj);
    public Concessionaria getByNumeroCliente(int numeroCli);
    public List<Concessionaria> getByNomePraca(String pracaNome);
    public List<Concessionaria> getByPais(int pais);
    public Concessionaria getByArrecadacao(int idArrecadacao);
}
