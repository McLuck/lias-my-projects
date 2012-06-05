package com.compsis.sigf.dao;

import java.util.List;

import org.junit.Test;

import com.compsis.sigf.domain.Pista;
import com.compsis.sigf.domain.Sentido;

public class PistaDAOTest {
	
	@Test
	public void getByPraca(){
		int pracaTest = 5;
		
		PistaDAO dao = PistaDAO.getInstance();
		List<Pista> pistas = dao.getByPraca(pracaTest);
		for(Pista p : pistas){
			System.out.println(p.toString());
		}
	}
	
	@Test
	public void getByTipo(){
		PistaDAO dao = PistaDAO.getInstance();
		List<Pista> pistas = dao.getByPraca(2);
		for(Pista p : pistas){
			System.out.println(p);
		}
	}
}
