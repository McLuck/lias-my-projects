package com.compsis.sigf.regras.command;

import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Pista;
import com.compsis.sigf.domain.Praca;

/**
 *
 * @author Lucas Israel
 */
public class GeralConverte {

    /**
     * Tratamento da criação das IDS da tabela Origem. Estas IDs são referenciadas em todas as tabelas.
     */
    public static class IDS {

        /**
         * Trata da ID da concessionária. <br>
         * Tipo Origem = 1 <br>
         * @param conc Objeto de Concessionária. (Não precisa de sessão do HB aberta)
         * @return ID da concessionária no formato correto para a tabela <b>orgigem</b>.
         */
        public static Long GET_ID_CONCESSIONARIA(Concessionaria conc) {
            String id = String.valueOf(conc.getNumeroCliente());
            while (id.length() < 3) {
                id = "0" + id;
            }
            id = (String.valueOf(conc.getNumeroPais()).concat(id));
            return Long.parseLong(id);
        }

        /**
         * Trata a ID da praca <br>
         * Tipo Origem = 2 <br>
         * @param praca Objeto de Praca. (Sessão deve estar aberta) <br>
         * @return ID da praça no formato correto para a tabela <b>origem<b>.
         */
        public static Long GET_ID_PRACA(Praca praca) {
            String id = "";
            id = String.valueOf(praca.getNumeroPraca());
            while (id.length() < 4) {
                id = "0".concat(id);
            }
            id = String.valueOf(GET_ID_CONCESSIONARIA(praca.getConcessionaria())).concat(id);
            return Long.parseLong(id);
        }

        /**
         * Trata a ID da localização <br>
         * <b>ATENÇÃO:</b> O SIGF não está preparado para apoiar multiplas praças de forma automática, isto é, gerar as IDs automaticamente. 
         * Caso utilize multiplas licalizações, favor conferir os scripts da tabela origem, após sua geração.<br>
         * Motivo: falta de padrão para estabelecer localização. Não existe um padrão de registro pra localização.
         * Tipo Origem = 3 <br>
         * @param praca Objeto de Praca. (Sessão deve estar aberta) <br>
         * @return ID da localizalçao no formato correto para a tabela <b>origem</b>
         */
        public static Long GET_ID_LOCALIZACAO(Praca praca) {
            String id = String.valueOf(GET_ID_PRACA(praca)).concat("00");
            return Long.parseLong(id);
        }

        /**
         * Trata a ID da pista. <br>
         * Tipo Origem: 4 <br>
         * @param p Objeto Pista. (Sessão deve estar aberta) <br>
         * @return ID da pista no formato correto para a tabela <b>origem</b>
         */
        public static Long GET_ID_PISTA(Pista p) {
            String id = String.valueOf(p.getNumeroPista());
            while (id.length() < 2) {
                id = "0".concat(id);
            }
            id = String.valueOf(GET_ID_LOCALIZACAO(p.getPraca())).concat(id);
            return Long.parseLong(id);
        }

        /**
         * Trata a ID da pista sentido. <br>
         * Tipo Origem: 5 <br>
         * @param p Objeto Pista. (Sessão deve estar aberta) <br>
         * @return ID da pista sentido no formato correto para a tabela <b>origem</b>
         */
        public static Long GET_ID_PISTA_SENTIDO(Pista p) {
            Praca praca = p.getPraca();
            String id = (p.getSentido().trim().equals(praca.getSentido1().trim())) ? "1" : "2";
            id = String.valueOf(GET_ID_PISTA(p)).concat(id);
            return Long.parseLong(id);
        }

        /**
         * Trata a ID do sentido. <br>
         * Tipo Origem: 6 <br>
         * @param praca Objeto Praca que se deseja a ID do sentido (Sessão deve estar aberta)
         * @param sentido Numero do Sentido (1 ou 2)
         * @return ID do sentido no formato correto para a tabela <b>origem</b>
         */
        public static Long GET_ID_SENTIDO(Praca praca, int sentido) {
            String id = String.valueOf(sentido);
            //00 pra expressar as pracas + o digito do sentido = 3 digitos.
            while (id.length() < 3) {
                id = "0".concat(id);
            }
            //ID concessionaria + praca + localizacao + formacao feita acima
            id = String.valueOf(GET_ID_LOCALIZACAO(praca)).concat(id);
            return Long.parseLong(id);
        }

        //Tratamento de Multiplos itens
        /**
         * Trata IDS de Pista sentido. Concatena as IDS de pista sentido. <br>
         * Tipo Origem: 5<br>
         * Separador: Ponto e Vírgula <b> ; </b><br>
         * @param p Praca para montar as IDS das pistas (Sessão deve estar aberta)
         * @return Uma String contendo todas as ids de Pista Sentidos (incluindo as reversiveis).
         */
        public static String GET_IDS_PISTAS_SENTIDOS(Praca p) {
            StringBuilder sb = new StringBuilder();
            for (Pista pt : p.getPistas()) {
                if (pt != null) {
                    sb.append(GET_ID_PISTA_SENTIDO(pt));
                    sb.append(";");
                }
            }
            return sb.toString();
        }

        /**
         * Trata IDS de Pista. Concatena as IDS de pista. <br>
         * Tipo Origem: 4<br>
         * Separador: Ponto e Vírgula <b> ; </b><br>
         * @param p Praca para montar as IDS das pistas (Sessão deve estar aberta)
         * @return Uma String contendo todas as ids de Pista (não repete reversiveis).
         */
        public static String GET_IDS_PISTAS(Praca p) {
            StringBuilder sb = new StringBuilder();
            for (Pista pt : p.getPistas()) {
                if (pt != null) {
                    sb.append(GET_ID_PISTA(pt));
                    sb.append(";");
                }
            }
            return sb.toString();
        }

        /**
         * Trata IDS de Pista sentido. Concatena as IDS de pista sentido. <br>
         * Tipo Origem: 2<br>
         * Separador: Ponto e Vírgula <b> ; </b><br>
         * @param conc Objeto concessionaria para carregar as IDS das pracas (Sessão deve estar aberta)
         * @return Uma String contendo todas as ids de todas as praças
         */
        public static String GET_IDS_PRACAS(Concessionaria conc) {
            StringBuilder sb = new StringBuilder();
            for (Praca p : conc.getPracas()) {
                if (p != null) {
                    sb.append(GET_ID_PRACA(p));
                    sb.append(";");
                }
            }
            return sb.toString();
        }
    }
}
