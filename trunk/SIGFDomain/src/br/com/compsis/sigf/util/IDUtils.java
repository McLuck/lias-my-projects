package br.com.compsis.sigf.util;

import com.compsis.sigf.domain.BASE;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Localizacao;
import com.compsis.sigf.domain.Pista;
import com.compsis.sigf.domain.Praca;
import com.compsis.sigf.domain.Sentido;

public class IDUtils {
	public static class IdOrigem{
		/**
		 * IDORIGEM para Concessionaria <br/>
		 * <b>TIPO ORIGEM = 1</b>
		 * @param conc
		 * @return
		 */
		public synchronized static String getIdOrigem(Concessionaria conc){
			StringBuffer sb = new StringBuffer();
			sb.append(conc.getNumeroPais());
			String numeroConc = String.valueOf(conc.getNumeroCliente());
			while(numeroConc.length()<3){
				numeroConc = "0".concat(numeroConc);
			}
			sb.append(numeroConc);
			return sb.toString();
		}
		/**
		 * IDORIGEM para Pra�a <br />
		 * <b>TIPO ORIGEM = 2</b>
		 * @param praca
		 * @return
		 */
		public synchronized static String getIdOrigem(Praca praca){
			StringBuffer sb = new StringBuffer();
			sb.append(getIdOrigem(praca.getConcessionaria()));
			String numeroPraca = String.valueOf(praca.getNumeroPraca());
			while(numeroPraca.length()<3){
				numeroPraca = "0".concat(numeroPraca);
			}
			sb.append(numeroPraca);
			return sb.toString();
		}
		/**
		 * IDORIGEM para Localizacao <br/>
		 * <b>TIPO ORIGEM = 3</b>
		 * @param local
		 * @return
		 */
		public synchronized static String getIdOrigem(Localizacao local){
			StringBuffer sb = new StringBuffer();
			sb.append(getIdOrigem(local.getPraca()));
			String numeroLocal = String.valueOf(local.getNumero());
			while(numeroLocal.length()<2){
				numeroLocal = "0".concat(numeroLocal);
			}
			return sb.toString();
		}
		/**
		 * IDORIGEM para Pista <br/>
		 * <b>TIPO ORIGEM = 4</b>
		 * @param pista
		 * @return
		 */
		public synchronized static String getIdOrigem(Pista pista){
			StringBuffer sb = new StringBuffer();
			sb.append(getIdOrigem(pista.getLocalizacao()));
			String numeroPista = String.valueOf(pista.getNumeroPista());
			while(numeroPista.length()<2){
				numeroPista = "0".concat(numeroPista);
			}
			sb.append(numeroPista);
			return sb.toString();
		}
		/**
		 * IDORIGEM para Pista Sentido <br/>
		 * <b>TIPO ORIGEM = 5</b>
		 * @param pista
		 * @param sentido
		 * @return
		 */
		public synchronized static String getIdOrigem(Pista pista, Sentido sentido){
			StringBuffer sb = new StringBuffer();
			sb.append(getIdOrigem(pista));
			String numeroSentido = String.valueOf(sentido.getNumero());
			numeroSentido = numeroSentido.substring(numeroSentido.length()-1, numeroSentido.length());
			sb.append(numeroSentido);
			return sb.toString();
		}
		/**
		 * IDORIGEM para Sentido <br/>
		 * <b>TIPO ORIGEM = 6</b>
		 * @param sentido
		 * @return
		 */
		public synchronized static String getIdOrigem(Sentido sentido){
			StringBuffer sb = new StringBuffer();
			sb.append(getIdOrigem(sentido.getLocalizacao()));
			String numeroSentido = String.valueOf(sentido.getNumero());
			numeroSentido = numeroSentido.substring(numeroSentido.length()-1, numeroSentido.length());
			while(numeroSentido.length()<5){
				numeroSentido = "0".concat(numeroSentido);
			}
			sb.append(numeroSentido);			
			return sb.toString();
		}
	}
	
	public static enum BD {
		ORACLE(Integer.valueOf(0)), SQL_SERVER(Integer.valueOf(1));
		private Integer bd;

		private BD(Integer bd) {
			this.bd = bd;
		}

		public Integer getCode() {
			return bd;
		}
		
		public String getDescricao(){
			switch(bd.intValue()){
			case BASE.SERVER.BD_ORACLE_11G : return "ORACLE";
			case BASE.SERVER.BD_MS_SQL_SERVER : return "SQL SERVER";
				default:return "Desconhecido";
			}
		}
	}

	public static enum PAIS {
		BRASIL(Integer.valueOf(760)), NIGERIA(Integer.valueOf(566));
		private Integer pais;

		private PAIS(Integer p) {
			this.pais = p;
		}

		public Integer getCode() {
			return pais;
		}

		public String getDescricao() {
			switch (pais.intValue()) {
			case 56:
				return "NigŽria";
			case 76:
				return "Brasil";
			default:
				return "Desconhecido";
			}
		}
	}
	
	public static enum IDIOMA {
		PORTUGUES(Integer.valueOf(0)), INGLES(Integer.valueOf(1));
		private Integer lang;
		private IDIOMA(Integer idioma){
			this.lang = idioma;
		}
		
		public Integer getCode(){
			return this.lang;
		}
		
		public String getDescricao(){
			switch(lang.intValue()){
			case 0:return "Portugu�s";
			case 1:return "Ingl�s";
			default: return "Desconhecido";
			}
		}
	}
}
