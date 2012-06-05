package com.compsis.sigf.domain;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class BASE {
	
	public final static class Origem{
		
	}

    /**
     * Listas e Arrays Fixos
     */
    public static class LISTAS {

        public static List<Categoria> CATEGORIAS;
        public static List<MeioPagamento> MEIOS_PAGAMENTO;
        public static List<TipoCategoria> TIPOS_CATEGORIA;
        public static List<TipoTransacao> TIPOS_TRANSACAO;
        public static List<TipoPista> TIPOS_PISTAS;
        public static List<ComboBox> IDIOMAS;
        public static List<ComboBox> SO_VERSAO;
        public static List<ComboBox> SO_EDICAO;
        public static List<ComboBox> SGBDs;
        public static List<ComboBox> LINKS;
        public static List<ComboBox> PERCENTUAL_CORRECAO_AUTOMATICA_CATEGORIAS_AMBIGUAS;
        public static Map<Integer, String> CORRECAO_CATEGORIA;

        /**
         * Carrega uma lista de categorias padrões para poupar tempo do usuário.
         * A lista já carrega com amarração com a concessionária, entretanto o objeto da concessionária precisa persistí-lo para salvar no BD.
         * @param conc Concessionária que irá ter a lista (Mandatório montar o relacionamento)
         * @return Lista de itens replicados do padroes de categorias
         */
        public static List<Categoria> ReplicarCategoriasPadroes(Concessionaria conc) {
            List<Categoria> lista = new ArrayList<Categoria>();
            for (Categoria c : CATEGORIAS) {
                lista.add((Categoria) c.replicate(conc));
            }
            return lista;
        }

        public static List<TipoTransacao> ReplicateTipoTransacaoPadroes(ConfiguracaoImagem confImagem) {
            List<TipoTransacao> lista = new ArrayList<TipoTransacao>();
            for (TipoTransacao t : TIPOS_TRANSACAO) {
                lista.add((TipoTransacao) t.replicate(confImagem));
            }
            return lista;
        }

        public static List<TipoPista> ReplicateTipoPistasPadroes(ConfiguracaoImagem confImagem) {
            List<TipoPista> lista = new ArrayList<TipoPista>();
            for (TipoPista tp : TIPOS_PISTAS) {
                lista.add((TipoPista) tp.replicate(confImagem));
            }
            return lista;
        }

        public static List<MeioPagamento> ReplicarMeiosPagamentosPadroes(Concessionaria conc) {
            List<MeioPagamento> lista = new ArrayList<MeioPagamento>();
            for (MeioPagamento mp : MEIOS_PAGAMENTO) {
                lista.add((MeioPagamento) mp.replicate(conc));
            }
            return lista;
        }
    }
    public static final int PAIS_BRASIL = 076;
    public static final int PAIS_NIGERIA = 566;

    public static String getIdioma(int PAIS){
    	if(PAIS == PAIS_BRASIL)return "Português";
    	return "Nigéria";
    }
    
    /**
     * Dados e tratamento de dados para Tipos (categorisa algum objeto ou atributo)
     */
    public static class TIPOS {

        /**
         * <b>Valor: 1</b>
         */
        public static final int SA_CENTRALIZADO = 1, CALCULO_CAT_ESPECIAL_MODALIDADE_1 = 1, TIPO_CATEGORIA_MOTO = 1, TIPO_PISTA_MANUAL = 1;
        /**
         * <b>Valor: 2</b>
         */
        public static final int SA_DISTRIBUIDO = 2,  CALCULO_CAT_ESPECIAL_MODALIDADE_2 = 2, TIPO_CATEGORIA_PASSEIO = 2, TIPO_PISTA_AUTOMATICA = 2;
        /**
         * <b>Valor: 3</b>
         */
        public static final int  TIPO_CATEGORIA_COMERCIAL = 3, SENTIDO_REVERSIVEL = 3, TIPO_PISTA_MISTA = 3;
        /**
         * <b>Valor: 4</b>
         */
        public static final int OUTRO = 4, CALCULO_CAT_ESPECIAL_MODALIDADE_4 = 4, TIPO_CATEGORIA_ESPECIAL = 4;
        /**
         * <b>Valor: 5</b>
         */
        public static final int TIPO_PISTA_LIVRE = 5;
        /**
         * <b>Valor: 6</b>
         */
        public static final int  TIPO_PISTA_MOTO = 6;

        /**
         * <b>Valor: 7</b>
         */
        public static final int  TIPO_PISTA_MISTA_NAO_EXCLUSIVA = 7;

        public static String GET_MODO_OPERACAO_SA(int s) {
            switch (s) {
                case SA_CENTRALIZADO:
                    return "Centralizado - Um servidor para a Concessionaria toda. Necessario link entre as pracas.";
                case SA_DISTRIBUIDO:
                    return "Distribuido - Um servidor por praca.";
                default:
                    return "Outro";
            }
        }

        public static String GET_TIPO_PISTA(int s) {
            for (TipoPista tp : LISTAS.TIPOS_PISTAS) {
                if (tp.getId() == s) {
                    return tp.getNome();
                }
            }
            return "Outro";
        }

        public static String GET_TIPO_CATEGORIA(int s) {
            for (TipoCategoria tc : LISTAS.TIPOS_CATEGORIA) {
                if (tc.getId() == s) {
                    return tc.getNome();
                }
            }
            return "Outro";
        }
    }

    /**
     * Dados e tratamento de dados para servidores
     */
    public static class SERVER {

        /**
         * <b>Valor: 1</b>
         */
        public static final int OS_WINDOWS_SERVER_2003 = 1, IDIOMA_PT_BR = 1, EDICAO_ENTERPRISE = 1, BD_ORACLE_10G = 1;
        /**
         * <b>Valor: 2</b>
         */
        public static final int OS_WINDOWS_SERVER_2008 = 2, IDIOMA_EN = 2, EDICAO_PROFFESSIONAL = 2, BD_ORACLE_11G = 2;
        /**
         * <b>Valor: 3</b>
         */
        public static final int OS_LINUX = 3, BD_MS_SQL_SERVER = 3;
        /**
         * <b>Valor: 4</b>
         */
        public static final int OS_OUTRO = 4, BD_OUTRO = 4, EDICAO_OUTRO = 4, IDIOMA_OUTRO = 4, OUTRO = 4;

        public static String GET_BD(int s) {
            switch (s) {
                case BD_MS_SQL_SERVER:
                    return "MS Sql Server";
                case BD_ORACLE_10G:
                    return "Oracle 10G";
                case BD_ORACLE_11G:
                    return "Oracle 11G";
                case BD_OUTRO:
                    return "Outro";
                default:
                    return "Outro";
            }
        }

        public static String GET_IDIOMA(int s) {
            switch (s) {
                case IDIOMA_EN:
                    return "Ingles";
                case IDIOMA_OUTRO:
                    return "Outro";
                case IDIOMA_PT_BR:
                    return "PortuguÃªs";
                default:
                    return "Outro";
            }
        }

        public static String GET_OS(int s) {
            switch (s) {
                case OS_LINUX:
                    return "Linux";
                case OS_OUTRO:
                    return "Outro";
                case OS_WINDOWS_SERVER_2003:
                    return "Windows Server 2003";
                case OS_WINDOWS_SERVER_2008:
                    return "Windows Server 2008";
                default:
                    return "Outro";
            }
        }
    }

    public static class ConjuntosInserts {  
        //SCRIPTS PRONTOS
        public static List<Tabela> INSERTS_GERAIS = new ArrayList<Tabela>();
        public static String SCRIPT_GERAL_BRASIL = new String();
        public static String SCRIPT_GERAL_NIGERIA = new String();
        public static String SCRIPT_PRACA_BRASIL = new String();
        public static String SCRIPT_PRACA_NIGERIA = new String();
        public static String SCRIPT_CONC_BRASIL = new String();
        public static String SCRIPT_CONC_NIGERIA = new String();
        public static String SCRIPT_COMUNS = new String();
    }
}
