package com.compsis.sigf.regras.command.sql;

import com.compsis.sigf.domain.Arrecadacao;
import com.compsis.sigf.domain.Campo;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.regras.command.Command;
import com.compsis.sigf.regras.command.PropertyRetriever;
import com.compsis.sigf.script.manager.ManagementScript;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import org.springframework.web.servlet.tags.Param;

/**
 *
 * @author Lucas Israel
 */
public class PreferenciasCommand extends SQLInserts implements Command, PropertyRetriever {

    private Concessionaria conc;
    public PreferenciasCommand(Tabela modelo, Concessionaria c) {
        super(modelo);
        this.conc = c;
    }
    
    @Override
    public void execute() {
        tabelas = new ArrayList<Tabela>();
        //MONTA TODAS OS INSERTS DE PREFERENCIAS

        //Versao do sistema - Preferencia 1
        Tabela t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("1.0.1");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);



        //Configuracao Debito e Credito da concessionaria Local

        //Credito
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("3");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);

        //Debito
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("2");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("3");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);




        //Caminhos
        //Resource para imagens
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("2");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("d:\\sicat\\sgap-sa\\resources\\image\\");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);


        //Politica de senha
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4046");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfiguracaAcesso().getComplexidade());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        //Politica de senha - Numero caracteres politica senha
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4047");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfiguracaAcesso().getQtdMinimaSegura());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        //Politica de senha - Dias para expirar a senha
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("31");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfiguracaAcesso().getDiaSenhaExpirar());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);

        //Politica de senha - Dias para expirar a senha
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4045");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfiguracaAcesso().getQtdRegistroSenha());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        //Politica de senha - Qntd erros de senha
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4027");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfiguracaAcesso().getToleranciaBloqueio());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        //Politica de senha - Senha expira por inatividade
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("110");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfiguracaAcesso().isSenhaExpira()?"0 0 3 * * ?":"0");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);

        //Politica de senha - DIAS para Senha expirar por inatividade
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("96");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor((conc.getConfiguracaAcesso().isSenhaExpira())?conc.getConfiguracaAcesso().getDiaSenhaExpirar():"0");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);

        //Portas de comunicação com SA - Número de portas separadas com ponto e virgula
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("98");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("5000;5001;5002;5003;5004;5145");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);

        //PROCESSO_ADAPTACAO_PROTOCOLO_SGMP_ATIVO
        boolean temSGMP = conc.possuiSGMP();
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("10000");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(temSGMP?"1":"0");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("3");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        //Porta de comunicacao entre SA-CS ( 0 para desabilitar) Padrao eh 5745
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("53");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(temSGMP?"1":"0");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("3");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        
        
        //Politica de senha - Status operador inativo
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("112");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfiguracaAcesso().getStatusOperadorInativo());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        //Politica de senha - Status operador inativo
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("32");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(5);
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        //Resource para relatorios
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("3");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("d:\\sicat\\sgap-sa\\resources\\report");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);



        //Bloqueio Peiodo: Numero de dias para periodo de bloqueio
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("2");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);



        //Indica quando os arquivos serao gerados. 1 - Após o bloqueio do período (default), 2 - Após o término do dia
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("6");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("10");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);



        //Intervalo entre HB
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("12");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("300");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);



        //Transferência dívida na revisão de correção de transações
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("14");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);



        //ID_ORIGEM_PRACA - preenche id do provedor na tabela de ContaDetalhesCGMP e SGMP
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("15");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("4");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);



        //ID_ORIGEM_PRACA - preenche id do provedor na tabela de ContaDetalhesCGMP e SGMP
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("16");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);


        System.gc();

        //Servidor Vas_Ves_absoluto local da maquina a ser armazenado
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("17");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("D:\\\\sicat\\\\app\\\\server\\\\sgap\\\\deploy\\\\vasves.war\\\\");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        
        
        //Tempo de bloqueio do login
        //insert into preferencias(idpreferencia, valor, sistema, tipo) values(25, '90', 1, 1);
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
        	if (cp.getNome().equals("idpreferencia")) {
        		cp.setValor("25");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor(String.valueOf(conc.getConfiguracaAcesso().getTempoBloqueio()));
        	} else if (cp.getNome().equals("sistema")) {
        		cp.setValor("1");
        	} else if (cp.getNome().equals("tipo")) {
        		cp.setValor("1");
        	}
        }
        tabelas.add(t);



        //Configurando o caminho de aquisição das imagens -LPR
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("34");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("D:\\sicat\\app\\server\\sgap\\deploy\\vasves.war\\");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);



        //Porta de comunicação com o nível 2
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("36");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);



        //Endereço de comunicação com o nível 2
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("37");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);



        //Exibicao do combo de gestores da tela de atribuicao de Tag
            /*
         * 0=nao exibe
         * valor inteiro= exibe a lista, desde que este numero seja o codigo do gestor na tabela Gestor. 
         * (Este gestor indicado sera o primeiro a ser exibido no combo).
         */
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("42");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("3");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);



        //Configura o tempo de timeout de sessão
            /*
         * Tempo em milissegundos.
         */
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("44");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("3600000");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("2");
            }
        }
        tabelas.add(t);



        //Indica o máximo de classes de tarifas a serem cadastrados pela interface de Classe de Tarifa
            /*
         * Valor Máximo: 255
         */
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("47");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("255");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);



        //Indica a exibição da seção de Responsável por Pista na Correção de Transações
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("48");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);



        //Intervalo, em segundos, que um HB pode ser considerado valido
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("13");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("30");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);



        //Havera validação do digito do CPF
        // 1 ATIVA  -  0 DESATIVAR
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("49");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);




        //Configuracoes vindas da tela. 

        //Calculo Categoria Especial
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getCalculoCatEspecial());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);


        //Exibe detalhes da praca no cabecalho dos relatorios
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("5");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.isExibirDescricaoPracaRelatorios());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);


        //Havera categoria ambigua
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("41");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.isCategoriaAmbigua() ? "1" : "0");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        String origemArquiv = conc.isCategoriaAmbigua() ? "1" : "0";
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("57");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(origemArquiv);
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);



        //Correcao Automatica Cat Ambigua
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("62");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.isCorrecaoAutomaticaCatAmbigua() ? "1" : "0");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("3");
            }
        }
        tabelas.add(t);


        //Porcentagem de Correcao para categoria Ambigua
        String pct = (conc.isCorrecaoAutomaticaCatAmbigua()) ? "-1" : String.valueOf(conc.getPercentCorrecaoAutoCatAmb());
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("62");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(pct);
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("3");
            }
        }
        tabelas.add(t);



        //Sessao 2.2  - Questao 6
            /*if (s.equals(Command.KEYS.ConfiguracaoPracaCommand)) {
        Tabela t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
        if (cp.getNome().equals("idpreferencia")) {
        cp.setValor("46");
        } else if (cp.getNome().equals("valor")) {
        Map m = (Map) mapa.get(s);
        cp.setValor(String.valueOf(conc.get));
        } else if (cp.getNome().equals("sistema")) {
        cp.setValor("0");
        } else if (cp.getNome().equals("tipo")) {
        cp.setValor("1");
        }
        }
        tabelas.add(t);
        }*/


        //Sessao 2.6 - Questao 7
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4001");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigArrecadacao().getFormArrecadador());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4012");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigArrecadacao().getFormVendCupons());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4009");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigArrecadacao().getFormSupervisor());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4011");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigArrecadacao().getFormRespPista());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4005");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigArrecadacao().getFormaDevTroco());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4010");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigArrecadacao().getFormSangria());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);


        System.gc();

        //Sistema 1
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4001");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigArrecadacao().getFormArrecadador());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4012");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigArrecadacao().getFormVendCupons());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4009");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigArrecadacao().getFormSupervisor());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4011");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigArrecadacao().getFormRespPista());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4005");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigArrecadacao().getFormaDevTroco());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4010");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigArrecadacao().getFormSangria());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);



        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("10");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigImagem().getServer() + ":18080/vasves");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);


        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("11");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigImagem().isTransacaoCorrecaoImg() ? "1" : "0");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }

        tabelas.add(t);

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("24");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigImagem().isConcatenaCodigoUrl() ? "1" : "0");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("18");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigImagem().getEstruturaDiretorio());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);


        /*t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
        if (cp.getNome().equals("idpreferencia")) {
        cp.setValor("46");
        } else if (cp.getNome().equals("valor")) {
        cp.setValor(m.get(Command.KEYS.CONF_PRACA_COBRANCA_EIXO_SUSPENSO));
        } else if (cp.getNome().equals("sistema")) {
        cp.setValor("1");
        } else if (cp.getNome().equals("tipo")) {
        cp.setValor("1");
        }
        }
        tabelas.add(t);*/
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4024");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigMalote().isLacreRepete() ? "0" : "1");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("40");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigMalote().getOpcExibicaoInterface());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("4");
            }
        }
        tabelas.add(t);

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4025");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigMalote().getDiasSemRepetirLacre());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4002");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigMalote().getOpcCriacaoMalote());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("4002");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigMalote().getOpcCriacaoMalote());
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);
        System.gc();
    }

    @Override
    public String getPropertyName() {
        return Command.KEYS.ArrecadacaoCommand;
    }

    @Override
    public Object getPropertyValue() {
        return ManagementScript.getInstance().export(tabelas);
    }
}
