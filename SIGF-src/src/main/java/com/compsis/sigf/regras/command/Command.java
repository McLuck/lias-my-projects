package com.compsis.sigf.regras.command;

/**
 *
 * @author Lucas Israel
 */
public interface Command {
    public void execute();
    
    /**
     * Chaves usadas nos mapas de valores dos fluxos de processamento de dados entre modelos<br>
     * **<b>SEMPRE USAR ESTA CLASSE PARA DEFINIR A CHAVE.</b> <br><br>
     * **<b>O VALOR DA CONSTANTE DEVE SER EXATAMENTE O NOME DADO A STRING</b><br><br>
     * **<b>VERIFIQUE SE NÃO EXISTE A CHAVE QUE PRECISA ANTES DE CRIAR OUTRA. NÃO CRIAR QUALQUER CHAVE SEM DEIXAR SEU NOME.</b> <br>
     */
    public abstract static class KEYS{
        //---------------------------- CHAVES CRIADAS POR LUCAS ISRAEL - INICIO ------------------------------------------------
        public static final String ConfiguracaoPracaCommand = "ConfiguracaoPracaCommand";
        public static final String ConfiguracaoImagemCommand = "ConfiguracaoImagemCommand";
        public static final String ConcessionariaCommand = "ConcessionariaCommand";
        public static final String ArrecadacaoCommand = "ArrecadacaoCommand";
        public static final String DepositoCommand = "DepositoCommand";
        public static final String PracaCommand = "PracaCommand";
        public static final String PistaCommand = "PistaCommand";
        
        //Mais usadas em Preferencias
        public static final String MALOTE_ID_REPETE= "MALOTE_ID_REPETE";
        public static final String MALOTE_OPC_CRIACAO_MALOTE= "MALOTE_OPC_CRIACAO_MALOTE";
        public static final String MALOTE_EXIBICAO_INTERFACE= "MALOTE_EXIBICAO_INTERFACE";
        public static final String MALOTE_DETALHE_CRIACAO_ARQUIVO_BANCARIO= "MALOTE_DETALHE_CRIACAO_ARQUIVO_BANCARIO";
        public static final String MALOTE_OPC_REGISTRO_DEPOSITO= "MALOTE_OPC_REGISTRO_DEPOSITO";
        public static final String MALOTE_DIAS_SEM_REPETIR= "MALOTE_DIAS_SEM_REPETIR";
        public static final String CONF_PRACA_COBRANCA_EIXO_SUSPENSO= "CONF_PRACA_COBRANCA_EIXO_SUSPENSO";
        public static final String CONF_IMAGEM_IP_SERVER= "CONF_IMAGEM_IP_SERVER";
        public static final String CONF_IMAGEM_ESTRUTURA_IMAGEM= "CONF_IMAGEM_ESTRUTURA_IMAGEM";
        public static final String CONF_IMAGEM_CONCATENAR_URL_IMAGEM= "CONF_IMAGEM_CONCATENAR_URL_IMAGEM";
        public static final String CONF_IMAGEM_IMAGENS_EXIBIDAS_INVERTIDAS= "CONF_IMAGEM_IMAGENS_EXIBIDAS_INVERTIDAS";
        public static final String CONF_IMAGEM_TRANSACAO_CORRECAO_IMG= "CONF_IMAGEM_TRANSACAO_CORRECAO_IMG";
        public static final String CONCESSIONARIA_CALCULO_CAT_ESP= "CONCESSIONARIA_CALCULO_CAT_ESP";
        public static final String CONCESSIONARIA_ORIGEM_ARQUIVO_CAT_AMBIGUA= "CONCESSIONARIA_ORIGEM_ARQUIVO_CAT_AMBIGUA";
        public static final String CONCESSIONARIA_PRACAS_EXIBE_DETALHES_CABECALHO = "CONCESSIONARIA_PRACAS_EXIBE_DETALHES_CABECALHO";
        public static final String CONCESSIONARIA_HAVERA_CAT_AMBIGUA= "CONCESSIONARIA_HAVERA_CAT_AMBIGUA";
        public static final String CONCESSIONARIA_CORRECAO_AUTO_CAT_AMBIGUA= "CONCESSIONARIA_CORRECAO_AUTO_CAT_AMBIGUA";
        public static final String CONCESSIONARIA_PORCENTAGEM_CORRECAO_AUTO_CAT_AMBIGUA= "CONCESSIONARIA_PORCENTAGEM_CORRECAO_AUTO_CAT_AMBIGUA";
        public static final String ARRECADACAO_FORM_DEV_TROCO= "ARRECADACAO_FORM_DEV_TROCO";
        public static final String ARRECADACAO_ARRECADADOR= "ARRECADACAO_ARRECADADOR";
        public static final String ARRECADACAO_SUPERVISOR= "ARRECADACAO_SUPERVISOR";
        public static final String ARRECADACAO_RESPONS_PISTA= "ARRECADACAO_RESPONS_PISTA";
        public static final String ARRECADACAO_VENDEDOR_CUPON= "ARRECADACAO_VENDEDOR_CUPON";
        public static final String ARRECADACAO_COLETOR_SANGRIA= "ARRECADACAO_COLETOR_SANGRIA";
        
        //Mais usadas em ORIGEM
        public static final String CONCESSIONARIA_ID_CONCESSIONARIA_ORIGEM = "CONCESSIONARIA_ID_CONCESSIONARIA_ORIGEM";
        public static final String PRACA_ID_PRACA_ORIGEM = "PRACA_ID_PRACA_ORIGEM";
        public static final String PRACA_ID_LOCALIZACAO_ORIGEM = "PRACA_ID_LOCALIZACAO_ORIGEM";
        public static final String PRACA_ID_SENTIDO_ORIGEM1 = "PRACA_ID_SENTIDO_ORIGEM1";
        public static final String PRACA_ID_SENTIDO_ORIGEM2 = "PRACA_ID_SENTIDO_ORIGEM2";
        public static final String CONCESSIONARIA_NOME = "CONCESSIONARIA_NOME";
        public static final String CONCESSIONARIA_OBJETO = "CONCESSIONARIA_OBJETO";
        
        
        //---------------------------- CHAVES CRIADAS POR LUCAS ISRAEL - FIM ------------------------------------------------
    }
}
