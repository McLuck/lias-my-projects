package com.compsis.sigf.regras.command.sql;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.compsis.sigf.adapt.MeioPagamentoAdapt;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.FuncionalidadeDAO;
import com.compsis.sigf.dao.TabelaDAO;
import com.compsis.sigf.domain.BASE;
import com.compsis.sigf.domain.Campo;
import com.compsis.sigf.domain.Categoria;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Funcionalidade;
import com.compsis.sigf.domain.IOrigem;
import com.compsis.sigf.domain.Localizacao;
import com.compsis.sigf.domain.MeioPagamento;
import com.compsis.sigf.domain.MotivoFechamentoPista;
import com.compsis.sigf.domain.Pista;
import com.compsis.sigf.domain.Praca;
import com.compsis.sigf.domain.PracaMeioPagamento;
import com.compsis.sigf.domain.Sentido;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.log.L;
import com.compsis.sigf.regras.command.Command;
import com.compsis.sigf.regras.command.GeralConverte;
import com.compsis.sigf.regras.command.PropertyRetriever;
import com.compsis.sigf.script.manager.ManagementScript;
import com.compsis.sigf.utils.UtilidadesGenericas;

/**
 *
 * @author Lucas Israel
 */
public class OrigemCommand extends SQLInserts implements Command, PropertyRetriever {

    public OrigemCommand(Tabela modelo, Tabela caminhoCV, Concessionaria conc) {
        super(modelo);
        mapa = new HashMap();
        this.caminhoCV = caminhoCV;
        this.conc = conc;
    }

    public OrigemCommand(Tabela modelo, Concessionaria conc) {
        super(modelo);
        this.conc = conc;
        mapa = new HashMap();
        TabelaDAO tdao = (TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);
        this.vid = modelo.getVersao().getId();
        List<Tabela> lista = tdao.getByVersaoAndNome(modelo.getVersao().getId(), "caminhocv");
        if (lista != null && !lista.isEmpty()) {
            for (Tabela t : lista) {
                if (t != null) {
                    t.getCampos();
                    caminhoCV = t;
                }
            }
        }
        lista = tdao.getByVersaoAndNome(modelo.getVersao().getId(), "operadororigem");
        if (lista != null && !lista.isEmpty()) {
            for (Tabela t : lista) {
                if (t != null) {
                    t.getCampos();
                    operadororigem = t;
                }
            }
        }
        lista = tdao.getByVersaoAndNome(modelo.getVersao().getId(), "operador");
        if (lista != null && !lista.isEmpty()) {
            for (Tabela t : lista) {
                if (t != null) {
                    t.getCampos();
                    operador = t;
                }
            }
        }
        //tdao.close();
        //tdao.clear();
    }
    private Map mapa;
    private Tabela caminhoCV, operador, operadororigem;
    private StringBuffer scriptPrimarios = new StringBuffer();
    private StringBuffer scriptsProntos = new StringBuffer();
    private Concessionaria conc;
    private int vid;
    private List<Tabela> tabelasPrincipais = new ArrayList<Tabela>();

    @Override
    public void execute() {
        tabelas = new ArrayList<Tabela>();

        {
            //Agrega o primeiro script para NA
            Tabela tb = (Tabela) modelo.replicate(null);
            for (Campo cp : tb.getCampos()) {
                if (cp != null) {
                    if (cp.getNome().trim().toLowerCase().equals("idorigem")) {
                        cp.setValor(0);
                    } else if (cp.getNome().trim().toLowerCase().equals("descricao")) {
                        cp.setValor("NA");
                    } else if (cp.getNome().trim().toLowerCase().equals("tipoorigem")) {
                        cp.setValor("0");
                    } else if (cp.getNome().trim().toLowerCase().equals("praca")) {
                        cp.setValor(null);
                    } else if (cp.getNome().trim().toLowerCase().equals("localizacao")) {
                        cp.setValor(null);
                    } else if (cp.getNome().trim().toLowerCase().equals("pista")) {
                        cp.setValor(null);
                    } else if (cp.getNome().trim().toLowerCase().equals("sentido")) {
                        cp.setValor(null);
                    } else if (cp.getNome().trim().toLowerCase().equals("numerocabine")) {
                        cp.setValor(null);
                    } else if (cp.getNome().trim().toLowerCase().equals("origempai")) {
                        cp.setValor(null);
                    } else if (cp.getNome().trim().toLowerCase().equals("tipopistaarrecadacao")) {
                        cp.setValor(null);
                    } else if (cp.getNome().trim().toLowerCase().equals("tipopistasentido")) {
                        cp.setValor(null);
                    } else if (cp.getNome().trim().toLowerCase().equals("tipopistasentido")) {
                        cp.setValor(null);
                    }
                }
            }
            tabelasPrincipais.add(tb);
        }

        L.d(this.getClass().getName(), "Append de scripts comuns...");
        //Agrega Scripts Comuns
        String scrpt = BASE.ConjuntosInserts.SCRIPT_COMUNS;
        {
            L.d(this.getClass().getName(), "Tratando preferencias e suas dependencias...");
            TabelaDAO dao = (TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);
            List<Tabela> list = dao.getByVersaoAndNome(vid, "preferencias");
            Tabela ttt = list.get(0);
            
            //Tratamento para TipoConfiguracaoCV / Sessao / ConfiguracaoCV
            Funcionalidade configsCV = FuncionalidadeDAO.getInstance().obter(Integer.valueOf(59));
            if(!conc.getFuncionalidades().contains(configsCV)){
            	scrpt = UtilidadesGenericas.validarRemoverScript(scrpt, "CONFIGCV");
            }
            PreferenciasCommand prefCom = new PreferenciasCommand(ttt, conc);
            prefCom.execute();
            scrpt = scrpt.replace("#PREFERENCIAS#", String.valueOf(prefCom.getPropertyValue()));
            
            //dao.close();
            //dao.clear();

            //Funcionalidadedeacesso
            //FuncionalidadeAcessoDAO fadao = new FuncionalidadeAcessoDAO();
            //List<Tabela> aux = fadao.getTablesFromFuncConcessionaria(conc.getFuncionalidades(), vid);
            //String temp = ManagementScript.getInstance().export(aux);
            //fadao.close();
            //fadao.clear();

            L.d(this.getClass().getName(), "Tratando funcionalidades e suas dependencias...");
            FuncionalidadeCommand fcommand = new FuncionalidadeCommand(modelo, conc, vid);
            fcommand.execute();
            List<Tabela> funcionalidadesDependencias = (List<Tabela>) fcommand.getTabelas();
            String temp = ManagementScript.getInstance().export(funcionalidadesDependencias);
            scrpt = scrpt.replace("#funcionalidadesacesso#", temp);
        }
        scriptsProntos.append(scrpt);
        
        
        
        //Tratamento de motivofechamentopista
        {
        	MotivoFechamentoPista mf = conc.getMotivoFechamento();
        	TabelaDAO tdao = (TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);
        	List<Tabela> listaMotivos = tdao.getByVersaoAndNome(vid, "motivofechamentopista");
        	Tabela t = listaMotivos.get(0);
        	if(mf.isFechamentoAntecipado()){
            	if(t!=null){
            		Tabela t2 = (Tabela)t.replicate(null);
            		for(Campo cp : t2.getCampos()){
            			if(cp!=null){
            				if(cp.getNome().toLowerCase().trim().equals("codigocv")){
            					cp.setValor("14");
            				}else if(cp.getNome().toLowerCase().trim().equals("descricao")){
            					cp.setValor("Fechamento Antecipado");
            				}
            			}
            		}
            		tabelas.add(t2);
            	}
        	}
        	if(mf.isFimTurno()){
            	if(t!=null){
            		Tabela t2 = (Tabela)t.replicate(null);
            		for(Campo cp : t2.getCampos()){
            			if(cp!=null){
            				if(cp.getNome().toLowerCase().trim().equals("codigocv")){
            					cp.setValor("3");
            				}else if(cp.getNome().toLowerCase().trim().equals("descricao")){
            					cp.setValor("Fim de Turno");
            				}
            			}
            		}
            		tabelas.add(t2);
            	}
        	}
        	if(mf.isGinastica()){
            	if(t!=null){
            		Tabela t2 = (Tabela)t.replicate(null);
            		for(Campo cp : t2.getCampos()){
            			if(cp!=null){
            				if(cp.getNome().toLowerCase().trim().equals("codigocv")){
            					cp.setValor("16");
            				}else if(cp.getNome().toLowerCase().trim().equals("descricao")){
            					cp.setValor("Ginástica Laboral");
            				}
            			}
            		}
            		tabelas.add(t2);
            	}
        	}
        	if(mf.isManutencaoPista()){
            	if(t!=null){
            		Tabela t2 = (Tabela)t.replicate(null);
            		for(Campo cp : t2.getCampos()){
            			if(cp!=null){
            				if(cp.getNome().toLowerCase().trim().equals("codigocv")){
            					cp.setValor("15");
            				}else if(cp.getNome().toLowerCase().trim().equals("descricao")){
            					cp.setValor("Manutenção da Pista");
            				}
            			}
            		}
            		tabelas.add(t2);
            	}
        	}
        	if(mf.isQre()){
            	if(t!=null){
            		Tabela t2 = (Tabela)t.replicate(null);
            		for(Campo cp : t2.getCampos()){
            			if(cp!=null){
            				if(cp.getNome().toLowerCase().trim().equals("codigocv")){
            					cp.setValor("17");
            				}else if(cp.getNome().toLowerCase().trim().equals("descricao")){
            					cp.setValor("QRE");
            				}
            			}
            		}
            		tabelas.add(t2);
            	}
        	}
        	if(mf.isQtoBanheiro()){
            	if(t!=null){
            		Tabela t2 = (Tabela)t.replicate(null);
            		for(Campo cp : t2.getCampos()){
            			if(cp!=null){
            				if(cp.getNome().toLowerCase().trim().equals("codigocv")){
            					cp.setValor("13");
            				}else if(cp.getNome().toLowerCase().trim().equals("descricao")){
            					cp.setValor("QTO (banheiro)");
            				}
            			}
            		}
            		tabelas.add(t2);
            	}
        	}
        	if(mf.isRefeicao()){
            	if(t!=null){
            		Tabela t2 = (Tabela)t.replicate(null);
            		for(Campo cp : t2.getCampos()){
            			if(cp!=null){
            				if(cp.getNome().toLowerCase().trim().equals("codigocv")){
            					cp.setValor("10");
            				}else if(cp.getNome().toLowerCase().trim().equals("descricao")){
            					cp.setValor("Refeição");
            				}
            			}
            		}
            		tabelas.add(t2);
            	}
        	}
        	if(mf.isServicoInterno()){
            	if(t!=null){
            		Tabela t2 = (Tabela)t.replicate(null);
            		for(Campo cp : t2.getCampos()){
            			if(cp!=null){
            				if(cp.getNome().toLowerCase().trim().equals("codigocv")){
            					cp.setValor("18");
            				}else if(cp.getNome().toLowerCase().trim().equals("descricao")){
            					cp.setValor("Serviço Interno");
            				}
            			}
            		}
            		tabelas.add(t2);
            	}
        	}
        	if(mf.isServicoInterno()){
            	if(t!=null){
            		Tabela t2 = (Tabela)t.replicate(null);
            		for(Campo cp : t2.getCampos()){
            			if(cp!=null){
            				if(cp.getNome().toLowerCase().trim().equals("codigocv")){
            					cp.setValor("18");
            				}else if(cp.getNome().toLowerCase().trim().equals("descricao")){
            					cp.setValor("Serviço Interno");
            				}
            			}
            		}
            		tabelas.add(t2);
            	}
        	}
        	if(mf.isTrocaTurno()){
        		if(t!=null){
        			Tabela t2 = (Tabela)t.replicate(null);
        			for(Campo cp : t2.getCampos()){
        				if(cp!=null){
        					if(cp.getNome().toLowerCase().trim().equals("codigocv")){
        						cp.setValor("12");
        					}else if(cp.getNome().toLowerCase().trim().equals("descricao")){
        						cp.setValor("Troca de Pista");
        					}
        				}
        			}
        			tabelas.add(t2);
        		}
        	}
        	//FIM DO TRATAMENTO DE MOTIVOFECHAMENTOPISTA
        }
        
        {
            //Tratamento da Concessinaria;
            L.d(this.getClass().getName(), "Tratando insert origem Tipo 1 - Concessionaria ...");
            Tabela t = (Tabela) modelo.replicate(null);
            for (Campo cp : t.getCampos()) {
                if (cp.getNome().equals("idorigem")) {
                    cp.setValor(GeralConverte.IDS.GET_ID_CONCESSIONARIA(conc));
                } else if (cp.getNome().equals("tipoorigem")) {
                    cp.setValor("1");
                } else if (cp.getNome().equals("descricao")) {
                    cp.setValor(conc.getNome());
                }
            }
            tabelasPrincipais.add(t);
            L.d(this.getClass().getName(), "Concessionaria Definida...");

            {
                L.d(this.getClass().getName(), "Tratando categorias...");
                //MONTAR TABELAS DE CATEGORIAS... PRIMEIRA COISA.
                List<Tabela> auxList = new ArrayList<Tabela>();
                TabelaDAO tdao = (TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);
                List<Tabela> listTable = tdao.getByVersaoAndNome(vid, "categoria");
                Tabela ta = listTable != null && !listTable.isEmpty() ? listTable.get(0) : null;
                if (ta != null) {
                    int idc = 1;
                    for (Categoria cat : conc.getCategorias()) {
                        if (cat != null) {
                            Tabela ttemp = (Tabela) ta.replicate(null);
                            for (Campo cp : ttemp.getCampos()) {
                                if (cp != null) {
                                	idc = cat.getCatid();
                                    if (cp.getNome().trim().toLowerCase().equals("idcategoria")) {
                                        cp.setValor(idc);
                                    } else if (cp.getNome().trim().toLowerCase().equals("codigocategoriacv")) {
                                        cp.setValor(cat.getCgmp());
                                    } else if (cp.getNome().trim().toLowerCase().equals("descricao")) {
                                        cp.setValor(cat.getDescricao());
                                    } else if (cp.getNome().trim().toLowerCase().equals("numeroeixos")) {
                                        cp.setValor(cat.getEf());
                                    } else if (cp.getNome().trim().toLowerCase().equals("rodagemdupla")) {
                                        cp.setValor(cat.getRd());
                                    } else if (cp.getNome().trim().toLowerCase().equals("rodagemmoto")) {
                                        cp.setValor(cat.getRm());
                                    } else if (cp.getNome().trim().toLowerCase().equals("tipoveiculo")) {
                                        cp.setValor(cat.getTipoStr().toUpperCase().charAt(0));
                                    } else if (cp.getNome().trim().toLowerCase().equals("habilitaClassificacao")) {
                                    	cp.setValor((cat.isHabilitada())?"1":"0"); 
                                    }
                                }
                            }
                            auxList.add(ttemp);
                        }
                    }
                }
                if (auxList != null && !auxList.isEmpty()) {
                    String tt = ManagementScript.getInstance().export(auxList);
                    scriptPrimarios.append("insert into Cargo(IdCargo, Descricao, DataInsercao) values(0, 'Administrativo', dbo.trunc_date(getDate()));"
                            + "insert into TabelaCategorias(IdTabelaCategorias, IdOperador, InicioVigencia, Ativo, DataInsercao) values(-1, null, dbo.trunc_date(getDate()), 1, dbo.trunc_date(getDate()));");
                    scriptPrimarios.append(tt);
                }
                L.d(this.getClass().getName(), "Categorias Implementadas...");
            }

            L.d(this.getClass().getName(), "Append de scripts padrÃµes da concessionÃ¡ria...");
            //Agrega Scripts defaults da concessionaria
            String auxConc = (conc.getNumeroPais() == BASE.PAIS_NIGERIA) ? BASE.ConjuntosInserts.SCRIPT_CONC_NIGERIA : BASE.ConjuntosInserts.SCRIPT_CONC_BRASIL;
            auxConc = auxConc.replace("#concorigem#", String.valueOf(GeralConverte.IDS.GET_ID_CONCESSIONARIA(conc)));
            scriptsProntos.append(auxConc);

            String auxGeral = (conc.getNumeroPais() == BASE.PAIS_NIGERIA) ? BASE.ConjuntosInserts.SCRIPT_GERAL_NIGERIA : BASE.ConjuntosInserts.SCRIPT_GERAL_BRASIL;
            scriptsProntos.append(auxGeral);

            L.d(this.getClass().getName(), "Tratando Meios de Pagamento e suas dependencias...");
            //Agrega Scripts defaults dos Meios de Pagamentos Selecionados
            List<Tabela> lstAux = new ArrayList<Tabela>();
            String a = new MeioPagamentoAdapt(conc.getMeiosPagamento(), vid).getScripts();
            
            //ordena
            //Collections.sort(lstAux);
            String temp = scriptsProntos.toString();
            temp = temp.replace("#meiopagamentos#", a);
            scriptsProntos.setLength(0);
            scriptsProntos.append(temp);
            L.d(this.getClass().getName(), "Meios de Pagamentos foram tratados e exportados...");
        }
        {
            gc();
            //Tratamento das pracas
            L.d(this.getClass().getName() , "Tratando dados de Pracas...");
            for (Praca pr : conc.getPracas()) {
                if (pr != null) {
                	//Insere a praca
                    Tabela t = (Tabela) modelo.replicate(null);
                    for (Campo cp : t.getCampos()) {
                        if (cp.getNome().equals("idorigem")) {
                            cp.setValor(GeralConverte.IDS.GET_ID_PRACA(pr));
                        } else if (cp.getNome().equals("tipoorigem")) {
                            cp.setValor("2");
                        } else if (cp.getNome().equals("descricao")) {
                            cp.setValor(pr.getNome());
                        } else if (cp.getNome().equals("praca")) {
                            cp.setValor(pr.getNumeroPraca());
                        } else if (cp.getNome().equals("idorigempai")) {
                            cp.setValor(GeralConverte.IDS.GET_ID_CONCESSIONARIA(conc));
                        } else if (cp.getNome().equals("flaglocaloperacao")) {
                            cp.setValor("1");
                        }
                    }
                    tabelasPrincipais.add(t);

                    {
                        //Insere operadororigem
                        TabelaDAO tdao = (TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);
                        List<Tabela> lisAux = tdao.getByVersaoAndNome(vid, "operadororigem");
                        if (lisAux != null && !lisAux.isEmpty()) {
                            Tabela tbl = lisAux.get(0);
                            for (Campo cp : tbl.getCampos()) {
                                if (cp != null) {
                                    if (cp.getNome().trim().equals("idorigem")) {
                                        cp.setValor(GeralConverte.IDS.GET_ID_PRACA(pr));
                                    }
                                }
                            }
                            tabelas.add(tbl);
                        }
                    }
                    
                    //Insere dependencias 
                    Tabela tDenominacao = TabelaDAO.getInstance().getByVersaoAndNome(vid, "denominacao").get(0);
                	Tabela tPacote = TabelaDAO.getInstance().getByVersaoAndNome(vid, "pacote").get(0);
                	Tabela tArea = TabelaDAO.getInstance().getByVersaoAndNome(vid, "area").get(0);
                	Tabela tpacotesArea = TabelaDAO.getInstance().getByVersaoAndNome(vid, "pacotesdaarea").get(0);
                	tabelas.addAll(pr.getDependencia().getTabelasAreas(pr.getDependencia().getAreas(), tArea));
                	tabelas.addAll(pr.getDependencia().getTabelasDenominacoes(pr.getDependencia().getDenominacoes(), tDenominacao));
                	tabelas.addAll(pr.getDependencia().getTabelasPacotes(pr.getDependencia().getPacotes(), tPacote));
                	tabelas.addAll(pr.getDependencia().getTabelasPacotesDaArea(pr.getDependencia().getPacotesDaArea(), tpacotesArea));



                    //Agrega Scripts Defaults da Praca
                    String auxPraca = (pr.getConcessionaria().getNumeroPais() == BASE.PAIS_NIGERIA) ? BASE.ConjuntosInserts.SCRIPT_PRACA_NIGERIA : BASE.ConjuntosInserts.SCRIPT_PRACA_BRASIL;
                    auxPraca = auxPraca.replace("#pracaorigem#", String.valueOf(GeralConverte.IDS.GET_ID_PRACA(pr)));
                    auxPraca = auxPraca.replace("#urlimg#", pr.getConcessionaria().getConfigImagem().getIpServer().concat(":18080/vasves"));
                    scriptsProntos.append(auxPraca);




                    {
                        //Trabalha nos codigos dos meios de pagamentos por praca.
                        //Tabela codigopracameiopagamento
                        //Relacionamento N:M
                        TabelaDAO tdao = (TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);
                        Tabela tpmp = null;
                        List<Tabela> listaT = tdao.getByVersaoAndNome(vid, "codigopracameiopagamento");
                        if (listaT != null && !listaT.isEmpty()) {
                            for (Tabela tpmp2 : listaT) {
                                if (tpmp2 != null) {
                                    tpmp2.getCampos();
                                    tpmp = tpmp2;
                                    break;
                                }
                            }
                        }
                        if (tpmp != null) {
                            for (PracaMeioPagamento pm : pr.getPracaMeiosPgto()) {
                                if (pm != null && pm.getMeioPagto().isHabilitado()) {
                                	String[]cod = pm.getCodPracaLocal().split(",");
                                	
                                    Tabela tbaux = (Tabela) tpmp.replicate(null);
                                    for (Campo cp : tbaux.getCampos()) {
                                        if (cp.getNome().trim().toLowerCase().equals("idmeiopagamentointeroperacao")) {
                                            cp.setValor(pm.getMeioPagto().getConfiguracao());
                                        } else if (cp.getNome().trim().toLowerCase().equals("codigopracalocal")) {
                                            cp.setValor(GeralConverte.IDS.GET_ID_SENTIDO(pr, 1));
                                        } else if (cp.getNome().trim().toLowerCase().equals("codigopracameiopagamento")) {
                                            cp.setValor(cod[0].trim());
                                        }
                                    }
                                    tabelas.add(tbaux);
                                    
                                    tbaux = (Tabela) tpmp.replicate(null);
                                    for (Campo cp : tbaux.getCampos()) {
                                        if (cp.getNome().trim().toLowerCase().equals("idmeiopagamentointeroperacao")) {
                                            cp.setValor(pm.getMeioPagto().getConfiguracao());
                                        } else if (cp.getNome().trim().toLowerCase().equals("codigopracalocal")) {
                                            cp.setValor(GeralConverte.IDS.GET_ID_SENTIDO(pr, 2));
                                        } else if (cp.getNome().trim().toLowerCase().equals("codigopracameiopagamento")) {
                                            cp.setValor(cod[1].trim());
                                        }
                                    }
                                    tabelas.add(tbaux);
                                }
                            }
                        }
                    }

                    {
                        //Insere as pistas
                        L.d(this.getClass().getName() , "Tratando dados das Pistas da Praca...");
                        for(Localizacao loc : pr.getLocalizacoes()){
                        	if(loc!=null){
                        		t = (Tabela) modelo.replicate(null);
                                for (Campo cp : t.getCampos()) {
                                    if (cp.getNome().equals("idorigem")) {
                                        cp.setValor(GeralConverte.IDS.GET_ID_LOCALIZACAO(loc));
                                    } else if (cp.getNome().equals("tipoorigem")) {
                                        cp.setValor("3");
                                    } else if (cp.getNome().equals("descricao")) {
                                        cp.setValor(loc.getDescricao());
                                    } else if (cp.getNome().equals("praca")) {
                                        cp.setValor(pr.getNumeroPraca());
                                    } else if (cp.getNome().equals("Localizacao")) {
                                    	cp.setValor(loc.getNumero());
                                    } else if (cp.getNome().equals("idorigempai")) {
                                        cp.setValor(GeralConverte.IDS.GET_ID_PRACA(pr));
                                    }
                                }
                                tabelasPrincipais.add(t);
                        		for (Pista pt : loc.getPistas()) {
                                    if (pt != null) {
                                        Tabela tpt = (Tabela) modelo.replicate(null);
                                        for (Campo cp : tpt.getCampos()) {
                                            if (cp.getNome().equals("idorigem")) {
                                                cp.setValor(pt.getIdOrigem());
                                            } else if (cp.getNome().equals("tipoorigem")) {
                                                cp.setValor("4");
                                            } else if (cp.getNome().equals("descricao")) {
                                                cp.setValor(pt.getDescricao());
                                            } else if (cp.getNome().equals("praca")) {
                                                cp.setValor(pt.getPracaOrigem());
                                            } else if (cp.getNome().equals("idorigempai")) {
                                                cp.setValor(pt.getIdOrigemPai());
                                            } else if (cp.getNome().equals("pista")) {
                                                cp.setValor(pt.getPistaOrigem());
                                            } else if (cp.getNome().equals("numerocabine")) {
                                                cp.setValor(pt.getNumeroCabine());
                                            } else if (cp.getNome().equals("tipopistaarrecadacao")) {
                                                cp.setValor(pt.getTipoPistaArrecadacao());
                                            }
                                        }
                                        tabelasPrincipais.add(tpt);

                                        //Insere operador pra cada pista
                                        tpt = (Tabela) operador.replicate(null);
                                        for (Campo cp : tpt.getCampos()) {
                                            if (cp != null) {
                                                if (cp.getNome().equals("idoperador")) {
                                                    String id = String.valueOf(pr.getNumeroPraca());
                                                    String auxx = String.valueOf(pt.getNumeroPista());
                                                    while (auxx.length() < 4) {
                                                        auxx = "0".concat(auxx);
                                                    }
                                                    id = "-" + id.concat(auxx);
                                                    cp.setValor(id);
                                                } else if (cp.equals("nome")) {
                                                    cp.setValor("TPT Pista ".concat(String.valueOf(pt.getNumeroPista())));
                                                } else if (cp.getNome().equals("situacaocadastro")) {
                                                    cp.setValor("3");
                                                }
                                            }
                                        }

                                        //Insere Operador Origem para cada operador
                                        tpt = (Tabela) operadororigem.replicate(null);
                                        for (Campo cp : tpt.getCampos()) {
                                            if (cp != null) {
                                                if (cp.getNome().equals("idoperador")) {
                                                    String id = String.valueOf(pr.getNumeroPraca());
                                                    String auxx = String.valueOf(pt.getNumeroPista());
                                                    while (auxx.length() < 4) {
                                                        auxx = "0".concat(auxx);
                                                    }
                                                    id = "-" + id.concat(auxx);
                                                    cp.setValor(id);
                                                } else if (cp.getNome().equals("idorigem")) {
                                                    cp.setValor(pr.getIdOrigem());
                                                }
                                            }
                                        }


                                        //Insere Pista Sentido
                                        for(IOrigem psentido : pt.getPistaSentidos()){
                                        	tpt = (Tabela) modelo.replicate(null);
                                        	for (Campo cp : tpt.getCampos()) {
                                                if (cp.getNome().equals("idorigem")) {
                                                    cp.setValor(psentido.getIdOrigem());
                                                } else if (cp.getNome().equals("tipoorigem")) {
                                                    cp.setValor(psentido.getTipoOrigem());
                                                } else if (cp.getNome().equals("descricao")) {
                                                    cp.setValor(psentido.getDescricao());
                                                } else if (cp.getNome().equals("praca")) {
                                                    cp.setValor(psentido.getPracaOrigem());
                                                } else if (cp.getNome().equals("idorigempai")) {
                                                    cp.setValor(psentido.getIdOrigemPai());
                                                } else if (cp.getNome().equals("pista")) {
                                                    cp.setValor(psentido.getPistaOrigem());
                                                } else if (cp.getNome().equals("numerocabine")) {
                                                    cp.setValor(psentido.getNumeroCabine());
                                                } else if (cp.getNome().equals("tipopistaarrecadacao")) {
                                                    cp.setValor(psentido.getTipoPistaArrecadacao());
                                                } else if (cp.getNome().equals("sentido")) {
                                                    cp.setValor(psentido.getSentidoOrigem());
                                                }
                                            }
                                        	tabelasPrincipais.add(tpt);
                                        	
                                        	
                                        }
                                       
                                        //Insere caminhoCV
                                        Tabela tcv = (Tabela) caminhoCV.replicate(null);
                                        for (Campo cp : tcv.getCampos()) {
                                            if (cp.getNome().equals("idorigem")) {
                                                cp.setValor(pt.getIdOrigem());
                                            } else if (cp.getNome().equals("caminhoarquivo")) {
                                                String caminho = pt.getIpMaquina().trim();
                                                caminho = caminho.concat("\\sicat$\\CV\\DADOS\\CV");
                                                caminho = caminho.concat(String.valueOf(pt.getNumeroPista()));
                                                cp.setValor(caminho);
                                            }
                                        }
                                        tabelas.add(tcv);
                                    }
                                }
                        		
                        		
                        		//Insere todos os sentidos
                        		for(Sentido s : loc.getSentidos()){
                        			t = (Tabela) modelo.replicate(null);
                                    for (Campo cp : t.getCampos()) {
                                        if (cp.getNome().equals("idorigem")) {
                                            cp.setValor(s.getIdOrigem());
                                        } else if (cp.getNome().equals("tipoorigem")) {
                                            cp.setValor(s.getTipoOrigem());
                                        } else if (cp.getNome().equals("descricao")) {
                                            cp.setValor(s.getDescricao());
                                        } else if (cp.getNome().equals("praca")) {
                                            cp.setValor(s.getPracaOrigem());
                                        } else if (cp.getNome().equals("idorigempai")) {
                                            cp.setValor(s.getIdOrigemPai());
                                        } else if (cp.getNome().equals("sentido")) {
                                            cp.setValor(s.getSentidoOrigem());
                                        }
                                    }
                                    tabelasPrincipais.add(t);
                        		}
                        	}
                        	
                        }
                    }
                }
                gc();
            }
        }
    }
    
    

    private void gc() {
        try {
            Thread.sleep(1);
            System.gc();
        } catch (Exception e) {
        }
    }

    @Override
    public String getPropertyName() {
        return "";
    }

    @Override
    public Object getPropertyValue() {
        return scriptPrimarios.append(ManagementScript.getInstance().export(tabelasPrincipais).concat(scriptsProntos.append(ManagementScript.getInstance().export(tabelas)).toString()).toString());
    }
}
