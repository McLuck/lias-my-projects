/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.dissectLOG.log;

import br.com.dissectLOG.base.Config;
import br.com.dissectLOG.dao.implementation.LogDAO;
import br.com.dissectLOG.dominio.Log;
import br.com.dissectLOG.utils.Converte;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lucas Israel
 * @see 09/10/11
 * @version 1.0
 * Contato: mcluck.ti@gmail.com
 *
 */
public class L {

    private static L instance;
    private static LogDAO ldao = new LogDAO();
    private static boolean run = true;
    public static long INTERVALO = 1000;

    public static String getColor(int tipo){
        switch(tipo){
            case INFO: return "#FFFAFA";
            case DEBUG: return "#ADD8E6";
            case AVISO: return "#87CEFA";
            case ERRO: return "#F08080";
            case FATAL: return "#CD5C5C";
            default : return "#FFFFFF";
        }
    }

    private static L getInstance() {
        if (instance == null) {
            instance = new L();
        }
        return instance;
    }

    public static String GET_OCORRENCIA(int oco){
        switch(oco){
            case ERRO:return "ERRO";
            case INFO:return "INFO";
            case AVISO:return "AVISO";
            case FATAL:return "FATAL";
            case DEBUG:return "DEBUG";
        }
        return "";
    }

    public void printLog(Log l) {
        if(!Config.LOG.PRINT_IN_CONSOLE){
            return;
        }
        if (l.getDataRegistro() == 0) {
            l.setDataRegistro(new java.util.Date().getTime());
        }
        StringBuffer sb = new StringBuffer();
        sb.append(" ");
        sb.append(Config.LOG.TAG_CONSOLE);
        sb.append(" ");
        sb.append(GET_OCORRENCIA(l.getOcorrencia()));
        sb.append(" ");
        sb.append(l.getDetalhe());
        sb.append("   ");
        sb.append(l.getExceptionApp());

        if (l.getOcorrencia() == ERRO) {
            System.err.println(sb.toString());
        }else{
            System.out.println(sb.toString());
        }
    }

    /**
     * Ocorrencias de nivel debug, mais utilizada por desenvolvedor
     */
    public final static int DEBUG = 0;
    /**
     * Ocorrencia de nivel informacional, utilizada apenas para lancar informacoes no log
     */
    public final static int INFO = 1;
    /**
     * Ocorrencia de nivel aviso, utilizada para lancar avisos do sistema no log
     */
    public final static int AVISO = 2;
    /**
     * Ocorrencia de nivel erro, utilizada para lancar todos os erros no log
     */
    public final static int ERRO = 3;
    /**
     * Ocorrencia de nivel fatal, utilizada para erros fatais no sistemas. Erros que impedem o funcionamento do sistema.
     */
    public final static int FATAL = 4;

   
}
