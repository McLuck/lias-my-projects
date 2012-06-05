package com.compsis.sigf.dao;

import com.compsis.sigf.domain.Localizacao;

public class LocalizacaoDAO extends BaseDAO<Localizacao>{
	public LocalizacaoDAO(){
		super(Localizacao.class);
	}
	private static LocalizacaoDAO instance;
	public static LocalizacaoDAO getInstance(){
		if(instance==null){
			instance = new LocalizacaoDAO();
		}
		return instance;
	}
}
