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
    
    private Tabela getPreferencia(String idPreferencia, Object valor, String sistema, String tipo){
    	Tabela t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor(idPreferencia);
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(valor);
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor(sistema);
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor(tipo);
            }
        }
        return t;
    }
    
    @Override
    public void execute() {
        tabelas = new ArrayList<Tabela>();
        //MONTA TODAS OS INSERTS DE PREFERENCIAS

        //Versao do sistema - Preferencia 1
        Tabela t = (Tabela) modelo.replicate(null);
        
        tabelas.add(getPreferencia("1", "1.0.1", "0", "4"));
        tabelas.add(getPreferencia("4041", "dbo.trunc_date(getDate())", "1", "1"));
        
        //Configuracao Debito e Credito da concessionaria Local
        tabelas.add(getPreferencia("1", "", "3", "4"));
        //Debito
        tabelas.add(getPreferencia("1", "", "3", "4"));

        //Caminhos
        //Resource para imagens
        tabelas.add(getPreferencia("2", "d:\\sicat\\sgap-sa\\resources\\image\\", "0", "4"));
        tabelas.add(getPreferencia("3", "d:\\sicat\\sgap-sa\\resources\\report", "0", "4"));

        //Politica de senha
        tabelas.add(getPreferencia("4046", String.valueOf(conc.getConfiguracaAcesso().getComplexidade()), "1", "1"));
        
        //Politica de senha - Numero caracteres politica senha
        tabelas.add(getPreferencia("4047", String.valueOf(conc.getConfiguracaAcesso().getQtdMinimaSegura()), "1", "1"));
        
        //Politica de senha - Dias para expirar a senha
        tabelas.add(getPreferencia("31", conc.getConfiguracaAcesso().getDiaSenhaExpirar(), "0", "4"));
        
        //Politica de senha - Dias para expirar a senha
        tabelas.add(getPreferencia("4045", conc.getConfiguracaAcesso().getQtdRegistroSenha(), "1", "1"));
        
        //Politica de senha - Qntd erros de senha
        tabelas.add(getPreferencia("4027", conc.getConfiguracaAcesso().getToleranciaBloqueio(), "1", "1"));
        
        //Politica de senha - Senha expira por inatividade
        tabelas.add(getPreferencia("110", conc.getConfiguracaAcesso().isSenhaExpira()?"0 0 3 * * ?":"0", "1", "4"));
        
        //Politica de senha - DIAS para Senha expirar por inatividade
        tabelas.add(getPreferencia("96", (conc.getConfiguracaAcesso().isSenhaExpira())?conc.getConfiguracaAcesso().getDiaSenhaExpirar():"0", "1", "4"));
        
        //Portas de comunicaÃ§Ã£o com SA - Numero de portas separadas com ponto e virgula
        tabelas.add(getPreferencia("98", "5000;5001;5002;5003;5004;5145", "1", "4"));
        
        //PROCESSO_ADAPTACAO_PROTOCOLO_SGMP_ATIVO
        boolean temSGMP = conc.possuiSGMP();
        tabelas.add(getPreferencia("10000", temSGMP?"1":"0", "3", "1"));
        
        //Porta de comunicacao entre SA-CS ( 0 para desabilitar) Padrao eh 5745
        tabelas.add(getPreferencia("53", temSGMP?"1":"0", "3", "1"));
        
        //Politica de senha - Status operador inativo
        tabelas.add(getPreferencia("112", conc.getConfiguracaAcesso().getStatusOperadorInativo(), "1", "1"));
        
        //Politica de senha - Status operador inativo
        tabelas.add(getPreferencia("32", Integer.valueOf(5), "0", "1"));
        
        //Bloqueio Peiodo: Numero de dias para periodo de bloqueio
        tabelas.add(getPreferencia("4", 2, "0", "1"));
        
        //Utiliza FTP
        tabelas.add(getPreferencia("4031", "0", "1", "4"));
        
        //Habilita Checklist de Verificação na tela de apuração de resultados
        tabelas.add(getPreferencia("76", "0", "0", "4"));
        
        //Habilita Checklist de Verificação na tela de apuração de resultados
        tabelas.add(getPreferencia("4064", "0", "1", "1"));

        //QUANTIDADE MÁXIMA DE TIPO DE ISENTOS QUE PODEM SER CADASTRADAS
        tabelas.add(getPreferencia("91", conc.getConfigArrecadacao().getQtdMaximaIsentos(), "1", "1"));

        //PreConsolidacao Automatica
        tabelas.add(getPreferencia("4004", "1", "0", "1"));
        
        //Configurar navegação das imagens na interface de Correção de Transações
        tabelas.add(getPreferencia("43", "0", "1", "1"));
        
        //Link para donwload dos zips de imagens
        tabelas.add(getPreferencia("4055", "http://SICATSGAP:18080/download", "1", "4"));
        
        //Dias Reprocessamento Buffer
        tabelas.add(getPreferencia("30", "5", "1", "4"));
        
        //Recebimento de arquivo de depósito
        tabelas.add(getPreferencia("39", "1", "0", "4"));
        
        //Gera o arquivo de envio de malotes.
        tabelas.add(getPreferencia("35", "0", "1", "1"));
        
        //modo de operação do filtro da correção e da pré-correção
        tabelas.add(getPreferencia("54", "1", "1", "1"));
        
        //modo de operação do filtro da correção e da pré-correção
        tabelas.add(getPreferencia("54", "1", "1", "1"));
        
        //Determina quantidade de tentativas máxima que uma mensagem poderá ser reprocessada antes de removê-la do buffer automaticamente 
        tabelas.add(getPreferencia("4071", "5", "1", "1"));
        
        //cronExpression para Scheduler de reprocessamento de mensagens no buffer. 
        tabelas.add(getPreferencia("4072", "0 0/5 * * * ?", "1", "4"));
        
        //Determina o formato do arquivo TXT 1071 (RMMTA) conforme RQ 01.05.70.135 
        tabelas.add(getPreferencia("4073", "2", "1", "1"));
        
        //Determina o número de threads utilizada para realizar o recalculo do sumário. (recalculo simultaneos de miniturnos) 
        tabelas.add(getPreferencia("4074", "100", "1", "4"));
        
        //Determina o número de threads utilizada para realizar o recalculo do sumário. (recalculo simultaneos de miniturnos) 
        tabelas.add(getPreferencia("4075", "2", "1", "4"));
        
        //Habilita a seleção de ação de correção para o botão "Corrigir Todas". 
        tabelas.add(getPreferencia("4076", "0", "1", "1"));
        
        //Número de linhas retornadas a cada reprocessamento do buffer. 
        tabelas.add(getPreferencia("4077", "150", "1", "1"));
        
        //Dias pesquisa correção transações
        tabelas.add(getPreferencia("4053", "300", "1", "1"));
        
        //Timeout de comunicação com a FA
        tabelas.add(getPreferencia("99", "0;0;0;0;0;0", "1", "4"));
        
        //Exportar arquivo contábil
        tabelas.add(getPreferencia("4037", "0", "1", "1"));
        
        //Caminho de geração dos arquivos para ERP - SGAP
        tabelas.add(getPreferencia("4043", "D:\\Sicat\\app\\server\\sgap\\deploy\\contabil.war", "1", "1"));

        //Indica quando os arquivos serao gerados. 1 - Apos o bloqueio do periodo (default), 2 - Apos o termino do dia
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("6");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor("1");
            } else if (cp.getNome().equals("sistema")) {
                cp.setValor("0");
            } else if (cp.getNome().equals("tipo")) {
                cp.setValor("1");
            }
        }
        tabelas.add(t);

        //Indica o horário da primeira geração dos arquivos
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
        	if (cp.getNome().equals("idpreferencia")) {
        		cp.setValor("7");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("1");
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



        //TransferÃªncia dÃ­vida na revisÃ£o de correÃ§Ã£o de transaÃ§Ãµes
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



        //Configurando o caminho de aquisiÃ§Ã£o das imagens -LPR
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



        //Porta de comunicacao com o nivel 2
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



        //EndereÃ§o de comunicaÃ§Ã£o com o nÃ­vel 2
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



        //Configura o tempo de timeout de sessÃ£o
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

        

        //Indica o maximo de classes de tarifas a serem cadastrados pela interface de Classe de Tarifa
            /*
         * Valor Maximo: 255
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



        //Indica a exibiÃ§Ã£o da seÃ§Ã£o de ResponsÃ¡vel por Pista na CorreÃ§Ã£o de TransaÃ§Ãµes
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



        //Havera validaÃ§Ã£o do digito do CPF
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
                cp.setValor(conc.isExibirDescricaoPracaRelatorios()?"1":"0");
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

        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
        	if (cp.getNome().equals("idpreferencia")) {
        		cp.setValor("102");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("0 0 1,15 * * ?");
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
        		cp.setValor("103");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("0");
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
        		cp.setValor("116");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("1");
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
        		cp.setValor("3001");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("120");
        	} else if (cp.getNome().equals("sistema")) {
        		cp.setValor("3");
        	} else if (cp.getNome().equals("tipo")) {
        		cp.setValor("1");
        	}
        }
        tabelas.add(t);
        
        
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
        	if (cp.getNome().equals("idpreferencia")) {
        		cp.setValor("3002");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("120");
        	} else if (cp.getNome().equals("sistema")) {
        		cp.setValor("3");
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

        
        //
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
        	if (cp.getNome().equals("idpreferencia")) {
        		cp.setValor("4000");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("2;3;4;5;6;7;14;15;16;17;18;19;20;21;");
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
        		cp.setValor("4017");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("0");
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
        		cp.setValor("4018");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("0");
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
        		cp.setValor("4019");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor(conc.getConfigMalote().getOpcExibicaoInterface());
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
        		cp.setValor("4022");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("0");
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
        		cp.setValor("4023");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("1");
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
        		cp.setValor("4024");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor(conc.getConfigMalote().isLacreRepete()?"0":"1");
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
        		cp.setValor("4025");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor(conc.getConfigMalote().isLacreRepete()?conc.getConfigMalote().getDiasSemRepetirLacre():"-1");
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


        //Servidor de imagens
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
            if (cp.getNome().equals("idpreferencia")) {
                cp.setValor("10");
            } else if (cp.getNome().equals("valor")) {
                cp.setValor(conc.getConfigImagem().getIpServer() + ":18080/vasves");
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
        
        t = (Tabela) modelo.replicate(null);
        for (Campo cp : t.getCampos()) {
        	if (cp.getNome().equals("idpreferencia")) {
        		cp.setValor("20");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("-1");
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
        		cp.setValor("26");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("0");
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
        		cp.setValor("27");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("D:\\SICAT\\sgmp\\PDV\\Cadastros");
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
        		cp.setValor("60");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("120000");
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
        		cp.setValor("28");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("0");
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
        		cp.setValor("4003");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("0");
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
        		cp.setValor("4003");
        	} else if (cp.getNome().equals("valor")) {
        		cp.setValor("0");
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
