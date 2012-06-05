package com.compsis.sigf.dao;

import org.apache.log4j.Logger;

public class TesteLog {
	public static final Logger log = Logger.getLogger(TesteLog.class);
	public static void main(String[] args) {
		info();
		warn();
		debug();
		error();
		fatal();
	}
	
	private static void debug(){
		log.debug("Isto esta em nivel de debug");
	}
	
	private static void info(){
		log.info("Isto esta em nivel de info");
	}
	
	private static void error(){
		log.error("Isto esta em nivel de error");
	}
	
	private static void warn(){
		log.warn("Isto esta em nivel de warn");
	}
	
	private static void fatal(){
		log.fatal("Isto esta em nivel de fatal");
	}
}
