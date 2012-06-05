package com.compsis.sigf.dao.interfaces;

import com.compsis.sigf.domain.Pista;

import java.util.List;

/**
 *
 * @author Lucas Israel
 */
public interface PistaInterfaceDAO extends BaseInterfaceDAO<Pista> {
    public List<Pista> getByPraca(int pracaId);
    public List<Pista> getByTipo(int tipo);
    public List<Pista> getBySentido(int pracaId, int sentido);
    public Pista getByIpMaquina(String ip, int pracaId);
}
