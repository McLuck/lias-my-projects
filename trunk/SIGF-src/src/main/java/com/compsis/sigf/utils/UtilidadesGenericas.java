package com.compsis.sigf.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import com.compsis.sigf.domain.Categoria;
import com.compsis.sigf.domain.Concessionaria;

public class UtilidadesGenericas {
	
	public static final String LINE_BREAK = System.getProperty("line.separator");
	
	public static Categoria getCatEsp(List<Categoria> listaCats){
		for(Categoria c : listaCats){
			if(c.getDescricao().toLowerCase().contains("esp")){
				return c;
			}
		}
		return null;
	}
	
    public static String validarRemoverScript(String sql, String tag){
        String[] linhas = sql.split(LINE_BREAK);
        boolean ignorar = false;
        StringBuilder sb = new StringBuilder();
        for(String linha : linhas){
            if(ignorar==false && linha.trim().toUpperCase().startsWith("--".concat(tag).trim().toUpperCase())){
            	ignorar = true;
                continue;
            }
            if(ignorar && linha.trim().toUpperCase().startsWith("--FIM-".concat(tag).trim().toUpperCase())){
                ignorar = false;
                continue;
            }
            if(!ignorar){
                sb.append(linha);
                sb.append(LINE_BREAK);
            }
        }
        return sb.toString();
    }
    
    public static String getCabecalhoScripts(Concessionaria conc){
    	StringBuilder sb = new StringBuilder();
    	
    	sb.append("-- Title: Configuração da Concessonaria ");
    	sb.append(conc.getNome());
    	
    	sb.append(LINE_BREAK);
    	
    	sb.append("-- Copyright (c) ");
    	sb.append(Calendar.getInstance().get(Calendar.YEAR));
    	sb.append(" COMPSIS Computadores e Sistemas LTDA");
    	sb.append(LINE_BREAK);
    	
    	sb.append("-- Rua Pindamonhangaba, 160 - Vila Nova Conceição");
    	sb.append(LINE_BREAK);
    	sb.append("-- 12231-090 - São José dos Campos - SP");
    	sb.append(LINE_BREAK);
    	sb.append("-- Projeto: SICAT XP");
    	sb.append(LINE_BREAK);
    	sb.append("-- Autor: Lucas Israel");
    	sb.append(LINE_BREAK);
    	sb.append("-- Data: ");
    	sb.append(new SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date()));
    	sb.append(LINE_BREAK);
    	sb.append(LINE_BREAK);
    	sb.append(LINE_BREAK);
    	
    	return sb.toString();
    }
}
