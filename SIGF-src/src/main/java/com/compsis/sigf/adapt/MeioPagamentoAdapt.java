package com.compsis.sigf.adapt;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.TabelaDAO;
import com.compsis.sigf.domain.Campo;
import com.compsis.sigf.domain.MeioPagamento;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.log.L;
import com.compsis.sigf.regras.command.GeralConverte;
import com.compsis.sigf.script.manager.ManagementScript;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


/**
 *
 * @author Lucas Israel
 */
public class MeioPagamentoAdapt {

    private List<Tabela> tabelas;
    private TabelaDAO tdao = (TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);
    private int vid;
    private MeioPagamento mpt;
    public MeioPagamentoAdapt(MeioPagamento mp, int vid) {
    	mpt = mp;
        L.d(this.getClass().getName(), "Adaptando Meio de Pagamento");
        this.vid = vid;
        tabelas = new ArrayList<Tabela>();
        
        if(!mp.isHabilitado()){
        	return;
        }
        
        Object ret = getTable(meiopagamento, getParamettersMP(mp));
        if (ret != null) {
            if (ret instanceof List) {
                List<Tabela> lst = (List<Tabela>) ret;
                tabelas.addAll(lst);
            } else if (ret instanceof Tabela) {
                tabelas.add((Tabela) ret);
            }
        }

        if (mp.getConfiguracao() == 7 || mp.getConfiguracao() == 4 || mp.getConfiguracao() == 1 || (mp.getConfiguracao() >= 14)) {
            ret = getTable(pessoajuridica, getParamettersPessoaJuridica(mp));
            if (ret != null) {
                if (ret instanceof List) {
                    List<Tabela> lst = (List<Tabela>) ret;
                    tabelas.addAll(lst);
                } else if (ret instanceof Tabela) {
                    tabelas.add((Tabela) ret);
                }
            }

            ret = getTable(enderecopessoajuridica, getParamettersEnderecoPessoaJuridica(mp));
            if (ret != null) {
                if (ret instanceof List) {
                    List<Tabela> lst = (List<Tabela>) ret;
                    tabelas.addAll(lst);
                } else if (ret instanceof Tabela) {
                    tabelas.add((Tabela) ret);
                }
            }

            ret = getTable(camaracompensacao, getParamettersCamaraCompens(mp));
            if (ret != null) {
                if (ret instanceof List) {
                    List<Tabela> lst = (List<Tabela>) ret;
                    tabelas.addAll(lst);
                } else if (ret instanceof Tabela) {
                    tabelas.add((Tabela) ret);
                }
            }

            boolean interop = false;
            ret = getTable(meiopagamentointeroperacao, getParamettersMeioPagamentoInterop(mp));
            if (ret != null) {
            	interop = true;
                if (ret instanceof List) {
                    List<Tabela> lst = (List<Tabela>) ret;
                    tabelas.addAll(lst);
                    
                    //Insert into processamentosmeiopagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)Values(14, 0, 0, dbo.trunc_date(getDate()),1);
                    for(Tabela ttb : lst){
                    	if(ttb!=null){
                    		String idmp = String.valueOf(mp.getConfiguracao());
                    		for(int i=0;i<13;i++){
                            	Object ret2 = getTable(ProcessamentosMeioPagamento, "idmeiopagamentointeroperacao='"+idmp+"';situacao=0;codigotipoprocessamento="+i+";idmeiopagamento="+idmp+";");
                            	if (ret2 != null) {
                                    if (ret2 instanceof List) {
                                        List<Tabela> lst2 = (List<Tabela>) ret2;
                                        tabelas.addAll(lst2);
                                    } else if (ret2 instanceof Tabela) {
                                        tabelas.add((Tabela) ret2);
                                    }
                                }
                            }
                    	}
                    }
                } else if (ret instanceof Tabela) {
                    tabelas.add((Tabela) ret);
                    String idmp = String.valueOf(mp.getConfiguracao());
            		for(int i=0;i<13;i++){
                    	Object ret2 = getTable(ProcessamentosMeioPagamento, "idmeiopagamentointeroperacao='"+idmp+"';situacao=0;codigotipoprocessamento="+i+";idmeiopagamento="+idmp+";");
                    	if (ret2 != null) {
                            if (ret2 instanceof List) {
                                List<Tabela> lst2 = (List<Tabela>) ret2;
                                tabelas.addAll(lst2);
                            } else if (ret2 instanceof Tabela) {
                                tabelas.add((Tabela) ret2);
                            }
                        }
                    }
                }
            }
            
            ret = getTable(gestor, getParamettersGestor(mp));
            if (ret != null) {
                if (ret instanceof List) {
                    List<Tabela> lst = (List<Tabela>) ret;
                    tabelas.addAll(lst);
                } else if (ret instanceof Tabela) {
                    tabelas.add((Tabela) ret);
                }
            }

            if(mp.getConfiguracao()>2){
            	ret = getTable(contabanco, getParamettersContaBanco(mp));
                if (ret != null) {
                    if (ret instanceof List) {
                        List<Tabela> lst = (List<Tabela>) ret;
                        tabelas.addAll(lst);
                    } else if (ret instanceof Tabela) {
                        tabelas.add((Tabela) ret);
                    }
                }	
            }
            
        }

        //Ordena
        Collections.sort(tabelas);
        L.d(this.getClass().getName(), "Meio de pagamento adaptado e ordenado.");
    }
    private String getDependencias(){
    	StringBuffer sb = new StringBuffer();
    	
    	switch(mpt.getConfiguracao()){
    	case 1:{
    		sb.append("INSERT  into classedetarifa(idclassedetarifa, idmeiopagamento, descricao, codigoprivilegio, editavel, datainsercao) values(-1, 1, 'Nominal', 0, 0, dbo.trunc_date(getDate())); ");
    		sb.append("INSERT  into classedetarifa(idclassedetarifa, idmeiopagamento, descricao, codigoprivilegio, editavel, datainsercao) values(1, 1, 'Dinheiro Cupons', 0, 0, dbo.trunc_date(getDate())); ");
    		break;
    	}
    	case 2:{
    		sb.append("INSERT  into classedetarifa(idclassedetarifa, idmeiopagamento, descricao, codigoprivilegio, editavel, datainsercao) values(2, 2, 'Cupom', 0, 0, dbo.trunc_date(getDate())); ");
    		break;
    	}
    	case 100:{
    			sb.append("INSERT  into rotinasinteroperabilidade(idmeiopagamentointeroperacao, disponibilizacaocadastros, enviolotes, geracaolotes, insercaotransacao, manipulacaotransacao, recebimentocadastros, recebimentolotesajuste, recebimentoprotocolofinanceiro, recebimentoprotocolotecnico, datainsercao) values(100, 'br.com.compsisnet.xp.sgcc.interop.ccrio.facade.disponibilizacaocadastro.facade.interfaces.DisponibilizacaoCadastroCCRIORemote', null, null, 'br.com.compsisnet.xp.sgcc.interop.ccrio.facade.insercaocontadetalhes.facade.interfaces.InsercaoContaDetalhesFacadeCCRIORemote', 'appletManutencaoTransacaoCcrio', 'recebimentoCadastrosCCRIO', null, null, null, dbo.trunc_date(getDate()));");
    			sb.append("INSERT  into pastatrabalhomeiopagamento (idmeiopagamentointeroperacao,pastaarquivoscomerro, pastagravacaolotes,pastahistoricocadastros,pastalotesenviados,pastarecebimentocadastros,pastarecebimentoprotocolostecn,datainsercao,pastarecebimentoprotocolosfina,pastahistoricorecebimentoproto,pastaenviolotes,pastarecebimentobd,pastaenvioimagens,pastaenviotarifas,pastarecebimentolistafull,pastaprotocolofinanceirotmp,pastaprotocolotecnicotmp,pastarecebimentocadastrotmp,pastaenviotarifastmp,pastarecebimentotarifas,pastarecebimentotarifastmp)values (");
        		sb.append(mpt.getConfiguracao());
        		sb.append(", 'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Erro','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\Lotes\\tmp','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Recebimento\\HistoricoCadastros','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\LotesEnviados','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Recebimento\\Cadastros',null,dbo.trunc_date(getDate()),null,null,'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\Lotes',null, null, null, null, null, null, null, null, null, null);");
        		sb.append("insert into configuracaomeiopagamento(idmeiopagamentointeroperacao, codigoconcessionaria, enviotransacoesbloqueadas, modoenviolotes, modogeracaolotes, modorecebimentolotesajuste, modorecebimentoprottecnicos, modorecebimentoprotfinanceiros, quantidademaximacadastros, quantidademaxiPIRegistroslote, tempomaximodadoscadastro, tempomaximoregistroslotes, tempopermanenciaregistroscadas, datainsercao, modorecebimentocadastros, flagpermiteinsercaomanual, tipoorigem) values(100, '5', 0, 1, 1, 1, 1, 1, 2, 100000, 720, 43200, 43200, dbo.trunc_date(getDate()), 1,0,2);");
    		break;
    	}
    	case 101 : {
    			sb.append("INSERT  into rotinasinteroperabilidade(idmeiopagamentointeroperacao, disponibilizacaocadastros, enviolotes, geracaolotes, insercaotransacao, manipulacaotransacao, recebimentocadastros, recebimentolotesajuste, recebimentoprotocolofinanceiro, recebimentoprotocolotecnico, datainsercao) values(101, 'br.com.compsisnet.xp.sgcc.interop.ccrio.facade.disponibilizacaocadastro.facade.interfaces.DisponibilizacaoCadastroCCRIORemote', null, null, 'br.com.compsisnet.xp.sgcc.interop.ccrio.facade.insercaocontadetalhes.facade.interfaces.InsercaoContaDetalhesFacadeCCRIORemote', 'appletManutencaoTransacaoCcrio', 'recebimentoCadastrosCCRIO', null, null, null, dbo.trunc_date(getDate())); ");
    			sb.append("INSERT  into pastatrabalhomeiopagamento (idmeiopagamentointeroperacao,pastaarquivoscomerro, pastagravacaolotes,pastahistoricocadastros,pastalotesenviados,pastarecebimentocadastros,pastarecebimentoprotocolostecn,datainsercao,pastarecebimentoprotocolosfina,pastahistoricorecebimentoproto,pastaenviolotes,pastarecebimentobd,pastaenvioimagens,pastaenviotarifas,pastarecebimentolistafull,pastaprotocolofinanceirotmp,pastaprotocolotecnicotmp,pastarecebimentocadastrotmp,pastaenviotarifastmp,pastarecebimentotarifas,pastarecebimentotarifastmp)values (");
        		sb.append(mpt.getConfiguracao());
        		sb.append(", 'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Erro','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\Lotes\\tmp','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Recebimento\\HistoricoCadastros','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\LotesEnviados','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Recebimento\\Cadastros',null,dbo.trunc_date(getDate()),null,null,'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\Lotes',null, null, null, null, null, null, null, null, null, null);");
        		sb.append("insert into configuracaomeiopagamento(idmeiopagamentointeroperacao, codigoconcessionaria, enviotransacoesbloqueadas, modoenviolotes, modogeracaolotes, modorecebimentolotesajuste, modorecebimentoprottecnicos, modorecebimentoprotfinanceiros, quantidademaximacadastros, quantidademaxiPIRegistroslote, tempomaximodadoscadastro, tempomaximoregistroslotes, tempopermanenciaregistroscadas, datainsercao, modorecebimentocadastros, flagpermiteinsercaomanual, tipoorigem) values(101, '5', 0, 1, 1, 1, 1, 1, 2, 100000, 720, 43200, 43200, dbo.trunc_date(getDate()), 1,0,2);");
    		break;
    	}
    	case 7 : {
    		sb.append("INSERT  into rotinasinteroperabilidade(idmeiopagamentointeroperacao, disponibilizacaocadastros, enviolotes, geracaolotes, insercaotransacao, manipulacaotransacao, recebimentocadastros, recebimentolotesajuste, recebimentoprotocolofinanceiro, recebimentoprotocolotecnico, datainsercao) values(7, 'br.com.compsisnet.xp.sgcc.interop.dbtrans.facade.interfaces.DisponibilizacaoCadastroDBTransRemote', 'envioLotesDBTrans', 'geracaoLotesDBTrans', '', 'appletManutencaoTransacaoCartao', '', '', '', '', dbo.trunc_date(getDate())); ");
    		sb.append("insert into temposmeiopagamento(idmeiopagamentointeroperacao, varreduracadastros, frequenciaenviolotes, frequenciageracaolotes, varreduralotesajuste, varreduraprotocolostecnicos, varreduraprotocolosfinanceiros, datainsercao)values(7, '', '', '0 0/60 * * * ?', null, '', '', dbo.trunc_date(getDate()));");
    		sb.append("INSERT  into pastatrabalhomeiopagamento (idmeiopagamentointeroperacao,pastaarquivoscomerro, pastagravacaolotes,pastahistoricocadastros,pastalotesenviados,pastarecebimentocadastros,pastarecebimentoprotocolostecn,datainsercao,pastarecebimentoprotocolosfina,pastahistoricorecebimentoproto,pastaenviolotes,pastarecebimentobd,pastaenvioimagens,pastaenviotarifas,pastarecebimentolistafull,pastaprotocolofinanceirotmp,pastaprotocolotecnicotmp,pastarecebimentocadastrotmp,pastaenviotarifastmp,pastarecebimentotarifas,pastarecebimentotarifastmp)values (");
    		sb.append(mpt.getConfiguracao());
    		sb.append(", 'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Erro','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\Lotes\\tmp','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Recebimento\\HistoricoCadastros','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\LotesEnviados','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Recebimento\\Cadastros',null,dbo.trunc_date(getDate()),null,null,'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\Lotes',null, null, null, null, null, null, null, null, null, null);");
    		break;
    	}
    	case 14 : {
    		sb.append("INSERT  into rotinasinteroperabilidade(idmeiopagamentointeroperacao, disponibilizacaocadastros, enviolotes, geracaolotes, insercaotransacao, manipulacaotransacao, recebimentocadastros, recebimentolotesajuste, recebimentoprotocolofinanceiro, recebimentoprotocolotecnico, datainsercao) values(14, 'br.com.compsisnet.xp.sgcc.interop.cgmp.facade.disponibilizacaocadastro.facade.interfaces.DisponibilizacaoCadastroCGMPRemote', 'envioLotesCGMP', 'geracaoLotesCGMP', 'br.com.compsisnet.xp.sgcc.interop.cgmp.facade.insercaocontadetalhes.facade.interfaces.InsercaoContaDetalhesFacadeCGMPRemote', 'appletManutencaoTransacaoCgmp', 'recebimentoCadastrosCGMP', null, 'recebimentoProtocolosFinanceirosCGMP', 'recebimentoProtocolosTecnicosCGMP', dbo.trunc_date(getDate())); ");
    		sb.append("insert into temposmeiopagamento (idmeiopagamentointeroperacao, varreduracadastros, frequenciaenviolotes, frequenciageracaolotes, varreduralotesajuste, varreduraprotocolostecnicos, varreduraprotocolosfinanceiros, datainsercao)values (14, '0 0/30 * * * ?', '0 40 0,8,16 * * ?', '0 0 0,8,16 * * ?', null, '0 0 1,9,17 * * ?', '0 0 2,10,18 * * ?', dbo.trunc_date(getDate()));");
    		sb.append("insert into pastatrabalhomeiopagamento(  idmeiopagamentointeroperacao,  pastaarquivoscomerro,  pastagravacaolotes,  pastahistoricocadastros,  pastalotesenviados,  pastarecebimentocadastros,  pastarecebimentoprotocolostecn,  datainsercao,  pastarecebimentoprotocolosfina,  pastahistoricorecebimentoproto,  pastaenviolotes,  pastarecebimentoBD,  pastaenvioimagens,  pastarecebimentolistafull,  pastarecebimentocadastrotmp,  pastaprotocolofinanceirotmp,  pastaprotocolotecnicotmp,  PastaEnvioTarifas,  PastaRecebimentoTarifas,  PastaRecebimentoTarifasTMP,  PastaEnvioTarifasTMP,  PastaRecebimentoVPC,  PastaRecebimentoVPCTMP,  PastaRecebimentoVPR,  PastaRecebimentoVPRTMP,  PastaHistoricoValePedagio,  PASTARECEBDESCMANUT, PASTARECEBDESCMANUTTMP, PASTAHISTORICODESCMANUT) values(  14,  'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\CGMP\\ViaFacilSemParar\\Erros',  'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\CGMP\\ViaFacilSemParar\\Lotes',  'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\CGMP\\ViaFacilSemParar\\HistoricoCadastros',  'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\CGMP\\ViaFacilSemParar\\LotesEnviados',  '\\\\<ip maquina>\\cgmp-edi\\2.RECEBIMENTO',  '\\\\<ip maquina>\\cgmp-edi\\2.RECEBIMENTO\\TRT',  dbo.trunc_date(getDate()),  '\\\\<ip maquina>\\cgmp-edi\\2.RECEBIMENTO\\TRF',  'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\CGMP\\ViaFacilSemParar\\HistoricoProtocolos',  '\\\\<ip maquina>\\cgmp-avi\\1.PENDENTES',  '\\\\172.16.0.11 ecebimento',  '\\\\<ip maquina>\\cgmp-avi\\2.IMAGENS',  '\\\\172.16.0.11 ecebimento',  'D:\\sicat\\app\\server\\sgap\\deploy\\interop.war\\CGMP\\ViaFacilSemParar\\Cadastros\\tmp',  'D:\\sicat\\app\\server\\sgap\\deploy\\interop.war\\CGMP\\ViaFacilSemParar\\ProtocolosFinanceiros\\tmp',  'D:\\sicat\\app\\server\\sgap\\deploy\\interop.war\\CGMP\\ViaFacilSemParar\\ProtocolosTecnicos\\tmp',  '\\\\<ip maquina>\\cgmp-edi\\1.ENVIO\\TAF',  '\\\\<ip maquina>\\cgmp-edi\\2.RECEBIMENTO\\TAT',  'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\CGMP\\TAF\\tmp\\',  'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\CGMP\\TAT\\tmp\\',  '\\\\<ip maquina>\\CGMP-EDI\\2.RECEBIMENTO\\VPC',  'D:\\sicat\\app\\server\\sgap\\deploy\\interop.war\\CGMP\\ViaFacilSemParar\\ValePedagio\\VPC\\tmp',  '\\\\<ip maquina>\\CGMP-EDI\\2.RECEBIMENTO\\VPR',  'D:\\sicat\\app\\server\\sgap\\deploy\\interop.war\\CGMP\\ViaFacilSemParar\\ValePedagio\\VPR\\tmp',  'D:\\sicat\\app\\server\\sgap\\deploy\\interop.war\\CGMP\\ViaFacilSemParar\\HistoricoValePedagio',  'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\CGMP\\ViaFacilSemParar\\DescontoManutencao',  'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\CGMP\\ViaFacilSemParar\\DescontoManutencao\\tmp',  'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\CGMP\\ViaFacilSemParar\\HistoricoDescontoManutencao');");
    		sb.append("insert into configuracaomeiopagamento(idmeiopagamentointeroperacao, codigoconcessionaria, enviotransacoesbloqueadas, modoenviolotes, modogeracaolotes, modorecebimentolotesajuste, modorecebimentoprottecnicos, modorecebimentoprotfinanceiros, quantidademaximacadastros, quantidademaximaregistroslote, tempomaximodadoscadastro, tempomaximoregistroslotes, tempopermanenciaregistroscadastros, datainsercao, modorecebimentocadastros, flagpermiteinsercaomanual, tipoorigem, ModoRecebPassagemCompradaVP, ModoRecebPassagemRealizadaVP,PermiteAtribuicaoTagBloqueado, nomeconcessionaria, recebemanual,MODORECEBDESCMANUTGERAL, MODORECEBDESCMANUTSUBST, MODORECEBDESCMANUTMANUT, MODORECEBDESCMANUTCONC) values (14, '277', 0, 1, 1, 1, 1, 1, 2, 2500, 720, 43200, 43200, dbo.trunc_date(getDate()), 1,1,6,1,1,1,'Porto Morrinho',1,1,1,1,1);");
    		sb.append("INSERT  into classedetarifa(idclassedetarifa, idmeiopagamento, descricao, codigoprivilegio, editavel, datainsercao) values(14, 14, 'Via Fácil/Sem Parar', 0, 0, dbo.trunc_date(getDate())); ");
    		sb.append("insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 0, 'TAG OK', 'BOA VIAGEM', dbo.trunc_date(getDate()), 1);insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 1, 'Veículo Roubado', 'COD1 CGMP', dbo.trunc_date(getDate()), 0);insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 2, 'Inadimplente', 'COD2 CGMP', dbo.trunc_date(getDate()), 1);insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 3, 'Sem Contrato', 'COD3 CGMP', dbo.trunc_date(getDate()), 0);insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 4, 'TAG Extraviado', 'COD4 CGMP', dbo.trunc_date(getDate()), 0);insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 5, 'Bloqueado', 'COD5 CGMP', dbo.trunc_date(getDate()), 0);insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 6, 'Verificação', 'COD6 CGMP', dbo.trunc_date(getDate()), 1);insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 7, 'TAG na Mão', 'COD7 CGMP', dbo.trunc_date(getDate()), 1);insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 8, 'CAT DAC Diferente CAT TAG', 'COD8 CGMP', dbo.trunc_date(getDate()), 1);insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 9, 'TAG não Devolvido', 'COD9 CGMP', dbo.trunc_date(getDate()), 1);insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 10, 'TAG de Outro Veículo', 'COD10 CGMP', dbo.trunc_date(getDate()), 1);");
    		break;
    	}
    	case 15:{
    		sb.append("INSERT  into rotinasinteroperabilidade(idmeiopagamentointeroperacao, disponibilizacaocadastros, enviolotes, geracaolotes, insercaotransacao, manipulacaotransacao, recebimentocadastros, recebimentolotesajuste, recebimentoprotocolofinanceiro, recebimentoprotocolotecnico, datainsercao) values(15, '', '', '', '', 'appletManutencaoTransacaoCartao', '', '', '', '', dbo.trunc_date(getDate())); ");
    		sb.append("insert into temposmeiopagamento(idmeiopagamentointeroperacao, varreduracadastros, frequenciaenviolotes, frequenciageracaolotes, varreduralotesajuste, varreduraprotocolostecnicos,varreduraprotocolosfinanceiros, datainsercao) values(15, '', '', '', null, '', '', dbo.trunc_date(getDate()));");
    		sb.append("INSERT  into pastatrabalhomeiopagamento (idmeiopagamentointeroperacao,pastaarquivoscomerro, pastagravacaolotes,pastahistoricocadastros,pastalotesenviados,pastarecebimentocadastros,pastarecebimentoprotocolostecn,datainsercao,pastarecebimentoprotocolosfina,pastahistoricorecebimentoproto,pastaenviolotes,pastarecebimentobd,pastaenvioimagens,pastaenviotarifas,pastarecebimentolistafull,pastaprotocolofinanceirotmp,pastaprotocolotecnicotmp,pastarecebimentocadastrotmp,pastaenviotarifastmp,pastarecebimentotarifas,pastarecebimentotarifastmp)values (");
    		sb.append(mpt.getConfiguracao());
    		sb.append("insert into classedetarifa(idclassedetarifa, idmeiopagamento, descricao, codigoprivilegio, editavel, datainsercao) values(15, 15, 'Visa Vale Pedágio', 0, 0, dbo.trunc_date(getDate()));");
    		sb.append(", 'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Erro','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\Lotes\\tmp','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Recebimento\\HistoricoCadastros','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\LotesEnviados','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Recebimento\\Cadastros',null,dbo.trunc_date(getDate()),null,null,'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\Lotes',null, null, null, null, null, null, null, null, null, null);");
    		break;
    	}
    	case 17 : {
    		sb.append("INSERT  into rotinasinteroperabilidade(idmeiopagamentointeroperacao, dispoibilizacaocadastros, enviolotes, geracaolotes, insercaotransacao, manipulacaotransacao, recebimentocadastros, recebimentolotesajuste, recebimentoprotocolofinanceiro, recebimentoprotocolotecnico, datainsercao) values(17, 'br.com.compsisnet.xp.sgcc.interop.cartao.facade.disponibilizacaocadastro.facade.interfaces.DisponibilizacaoCadastroCartaoRemote', NULL, NULL, NULL, 'appletManutencaoTransacaoCartao', NULL, NULL, NULL, NULL, dbo.trunc_date(getDate())); INSERT  into rotinasinteroperabilidade(idmeiopagamentointeroperacao, disponibilizacaocadastros, enviolotes, geracaolotes, insercaotransacao, manipulacaotransacao, recebimentocadastros, recebimentolotesajuste, recebimentoprotocolofinanceiro, recebimentoprotocolotecnico, datainsercao) values(15, '', '', '', '', 'appletManutencaoTransacaoCartao', '', '', '', '', dbo.trunc_date(getDate())); ");
    		sb.append("insert into temposmeiopagamento(idmeiopagamentointeroperacao, varreduracadastros, frequenciaenviolotes, frequenciageracaolotes, varreduralotesajuste, varreduraprotocolostecnicos, varreduraprotocolosfinanceiros, datainsercao)values(17, NULL, NULL, NULL, NULL, NULL, NULL,dbo.trunc_date(getDate()));");
    		sb.append("INSERT  into pastatrabalhomeiopagamento (idmeiopagamentointeroperacao,pastaarquivoscomerro, pastagravacaolotes,pastahistoricocadastros,pastalotesenviados,pastarecebimentocadastros,pastarecebimentoprotocolostecn,datainsercao,pastarecebimentoprotocolosfina,pastahistoricorecebimentoproto,pastaenviolotes,pastarecebimentobd,pastaenvioimagens,pastaenviotarifas,pastarecebimentolistafull,pastaprotocolofinanceirotmp,pastaprotocolotecnicotmp,pastarecebimentocadastrotmp,pastaenviotarifastmp,pastarecebimentotarifas,pastarecebimentotarifastmp)values (");
    		sb.append(mpt.getConfiguracao());
    		sb.append(", 'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Erro','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\Lotes\\tmp','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Recebimento\\HistoricoCadastros','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\LotesEnviados','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Recebimento\\Cadastros',null,dbo.trunc_date(getDate()),null,null,'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\Lotes',null, null, null, null, null, null, null, null, null, null);");
    		sb.append("insert into configuracaomeiopagamento(idmeiopagamentointeroperacao, codigoconcessionaria, enviotransacoesbloqueadas, modoenviolotes, modogeracaolotes, modorecebimentolotesajuste, modorecebimentoprottecnicos, modorecebimentoprotfinanceiros, quantidademaximacadastros, quantidademaxiPIRegistroslote, tempomaximodadoscadastro, tempomaximoregistroslotes, tempopermanenciaregistroscadas, datainsercao, modorecebimentocadastros, flagpermiteinsercaomanual, recebemanual, tipoorigem)values (17,5,0,1,1,1,1,1,1,1,720,43200,43200,sysdate,0,0,1,2);");
    		break;
    	}
    	case 18 :{
    		sb.append("INSERT  into rotinasinteroperabilidade(idmeiopagamentointeroperacao, disponibilizacaocadastros, enviolotes, geracaolotes, insercaotransacao, manipulacaotransacao, recebimentocadastros, recebimentolotesajuste, recebimentoprotocolofinanceiro, recebimentoprotocolotecnico, datainsercao) values(18, 'br.com.compsisnet.xp.sgcc.interop.cartao.facade.disponibilizacaocadastro.facade.interfaces.DisponibilizacaoCadastroCartaoRemote', NULL, NULL, NULL, 'appletManutencaoTransacaoCartao', NULL, NULL, NULL, NULL, dbo.trunc_date(getDate())); ");
    		sb.append("insert into temposmeiopagamento(idmeiopagamentointeroperacao, varreduracadastros, frequenciaenviolotes, frequenciageracaolotes, varreduralotesajuste, varreduraprotocolostecnicos, varreduraprotocolosfinanceiros, datainsercao)values(18, NULL, NULL, NULL, NULL, NULL, NULL, dbo.trunc_date(getDate()));");
    		sb.append("INSERT  into pastatrabalhomeiopagamento (idmeiopagamentointeroperacao,pastaarquivoscomerro, pastagravacaolotes,pastahistoricocadastros,pastalotesenviados,pastarecebimentocadastros,pastarecebimentoprotocolostecn,datainsercao,pastarecebimentoprotocolosfina,pastahistoricorecebimentoproto,pastaenviolotes,pastarecebimentobd,pastaenvioimagens,pastaenviotarifas,pastarecebimentolistafull,pastaprotocolofinanceirotmp,pastaprotocolotecnicotmp,pastarecebimentocadastrotmp,pastaenviotarifastmp,pastarecebimentotarifas,pastarecebimentotarifastmp)values (");
    		sb.append(mpt.getConfiguracao());
    		sb.append(", 'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Erro','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\Lotes\\tmp','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Recebimento\\HistoricoCadastros','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\LotesEnviados','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Recebimento\\Cadastros',null,dbo.trunc_date(getDate()),null,null,'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\Lotes',null, null, null, null, null, null, null, null, null, null);");
    		sb.append("insert into configuracaomeiopagamento(idmeiopagamentointeroperacao, codigoconcessionaria, enviotransacoesbloqueadas, modoenviolotes, modogeracaolotes, modorecebimentolotesajuste, modorecebimentoprottecnicos, modorecebimentoprotfinanceiros, quantidademaximacadastros, quantidademaxiPIRegistroslote, tempomaximodadoscadastro, tempomaximoregistroslotes, tempopermanenciaregistroscadas, datainsercao, modorecebimentocadastros, flagpermiteinsercaomanual, recebemanual, tipoorigem)values (18,5,0,1,1,1,1,1,1,1,720,43200,43200,sysdate,0,0,1,2);");
    		break;
    	}
    	case 19 : {
    		sb.append("INSERT  into rotinasinteroperabilidade(idmeiopagamentointeroperacao, disponibilizacaocadastros, enviolotes, geracaolotes, insercaotransacao, manipulacaotransacao, recebimentocadastros,recebimentolotesajuste, recebimentoprotocolofinanceiro, recebimentoprotocolotecnico,datainsercao ) values ( 19, 'br.com.compsisnet.xp.sgcc.interop.sgmp.facade.disponibilizacaocadastro.facade.interfaces.DisponibilizacaoCadastroSGMPRemote', 'envioLotesSGMP', 'geracaoLotesSGMP', 'br.com.compsisnet.xp.sgcc.interop.sgmp.facade.insercaocontadetalhes.facade.interfaces.InsercaoContaDetalhesFacadeSGMPRemote', 'appletManutencaoTransacaoSgmp', 'recebimentoCadastrosSGMP', null, 'recebimentoProtocolosFinanceirosSGMP', 'recebimentoProtocolosTecnicosSGMP',  dbo.trunc_date(getDate()));  ");
    		sb.append("insert into temposmeiopagamento (idmeiopagamentointeroperacao, varreduracadastros, frequenciaenviolotes, frequenciageracaolotes, varreduralotesajuste, varreduraprotocolostecnicos,varreduraprotocolosfinanceiros, datainsercao) values (19, '0 0/5 * * * ?', null, '0 0/30 * * * ?', null, null, null, dbo.trunc_date(getDate()));");
    		sb.append("INSERT  into pastatrabalhomeiopagamento (idmeiopagamentointeroperacao,pastaarquivoscomerro, pastagravacaolotes,pastahistoricocadastros,pastalotesenviados,pastarecebimentocadastros,pastarecebimentoprotocolostecn,datainsercao,pastarecebimentoprotocolosfina,pastahistoricorecebimentoproto,pastaenviolotes,pastarecebimentobd,pastaenvioimagens,pastaenviotarifas,pastarecebimentolistafull,pastaprotocolofinanceirotmp,pastaprotocolotecnicotmp,pastarecebimentocadastrotmp,pastaenviotarifastmp,pastarecebimentotarifas,pastarecebimentotarifastmp)values (");
    		sb.append(mpt.getConfiguracao());
    		sb.append(", 'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Erro','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\Lotes\\tmp','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Recebimento\\HistoricoCadastros','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\LotesEnviados','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Recebimento\\Cadastros',null,dbo.trunc_date(getDate()),null,null,'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\Lotes',null, null, null, null, null, null, null, null, null, null);");
    		break;
    	}
    	case 20 :{
    		sb.append("INSERT  into rotinasinteroperabilidade(idmeiopagamentointeroperacao, disponibilizacaocadastros, enviolotes, geracaolotes, insercaotransacao, manipulacaotransacao, recebimentocadastros,recebimentolotesajuste, recebimentoprotocolofinanceiro, recebimentoprotocolotecnico,datainsercao ) values ( 20, 'br.com.compsisnet.xp.sgcc.interop.sgmp.facade.disponibilizacaocadastro.facade.interfaces.DisponibilizacaoCadastroSGMPRemote', 'envioLotesSGMP', 'geracaoLotesSGMP', 'br.com.compsisnet.xp.sgcc.interop.sgmp.facade.insercaocontadetalhes.facade.interfaces.InsercaoContaDetalhesFacadeSGMPRemote', 'appletManutencaoTransacaoSgmp', 'recebimentoCadastrosSGMP', null, 'recebimentoProtocolosFinanceirosSGMP', 'recebimentoProtocolosTecnicosSGMP',  dbo.trunc_date(getDate())); ");
    		sb.append("insert into temposmeiopagamento (idmeiopagamentointeroperacao, varreduracadastros, frequenciaenviolotes, frequenciageracaolotes, varreduralotesajuste, varreduraprotocolostecnicos,varreduraprotocolosfinanceiros, datainsercao) values (20, '0 0/5 * * * ?', null, '0 0/30 * * * ?', null, null, null, dbo.trunc_date(getDate()));");
    		sb.append("INSERT  into pastatrabalhomeiopagamento (idmeiopagamentointeroperacao,pastaarquivoscomerro, pastagravacaolotes,pastahistoricocadastros,pastalotesenviados,pastarecebimentocadastros,pastarecebimentoprotocolostecn,datainsercao,pastarecebimentoprotocolosfina,pastahistoricorecebimentoproto,pastaenviolotes,pastarecebimentobd,pastaenvioimagens,pastaenviotarifas,pastarecebimentolistafull,pastaprotocolofinanceirotmp,pastaprotocolotecnicotmp,pastarecebimentocadastrotmp,pastaenviotarifastmp,pastarecebimentotarifas,pastarecebimentotarifastmp)values (");
    		sb.append(mpt.getConfiguracao());
    		sb.append(", 'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Erro','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\Lotes\\tmp','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Recebimento\\HistoricoCadastros','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\LotesEnviados','D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Recebimento\\Cadastros',null,dbo.trunc_date(getDate()),null,null,'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\SGMP\\PF\\Envio\\Lotes',null, null, null, null, null, null, null, null, null, null);");
    		break;
    	}
    	}
    	
    	return sb.toString();
    }
    public String getScripts() {
    	String scr = ManagementScript.getInstance().export(tabelas);
    	scr = scr.concat(getDependencias());
        return scr;
    }

    public List<Tabela> getTabelas() {
        return tabelas;
    }

    private String getParamettersPessoaJuridica(MeioPagamento mp) {
        StringBuffer sb = new StringBuffer();
        sb.append("idpessoajuridica=#idpessoajuridica#;");
        sb.append("razaosocial=#razaosocial#;");
        String res = sb.toString();
        res = res.replace("#idpessoajuridica#", String.valueOf(mp.getConfiguracao()));
        switch (mp.getConfiguracao()) {
            case 0: {
                res = res.replace("#razaosocial#", "VIAPAR");
                return res;
            }
            case 1: {
                res = res.replace("#razaosocial#", "Onda Livre");
                return res;
            }
            case 2: {
                res = res.replace("#razaosocial#", "Passe Expresso");
                return res;
            }
            case 14:
            case 3: {
                res = res.replace("#razaosocial#", "CGMP");
                return res;
            }
            case 15: {
                res = res.replace("#razaosocial#", "Visa");
                return res;
            }
            case 5:
            case 17:
            case 18: {
                res = res.replace("#razaosocial#", "Smart Card");
                return res;
            }
            case 16: {
                res = res.replace("#razaosocial#", "DBTrans");
                return res;
            }
            case 8: case 19 : case 20:{
                res = res.replace("#razaosocial#", "SCGMP");
                return res;
            }
            case 23 :{
                //Special Case - RODOSOL
                res = res.replace("#razaosocial#", mp.getConcessionaria().getNome());
                return res;
            }
        }
        return null;
    }

    private String getParamettersEnderecoPessoaJuridica(MeioPagamento mp) {
        StringBuffer sb = new StringBuffer();
        sb.append("idpessoajuridica=#idpessoajuridica#;");
        sb.append("idendereco=#idendereco#;");
        sb.append("numero=#numero#;");
        String res = sb.toString();
        res = res.replace("#idpessoajuridica#", String.valueOf(mp.getConfiguracao()));
        res = res.replace("#idendereco#", String.valueOf(mp.getConfiguracao()));
        switch (mp.getConfiguracao()) {
            case 0: {
                res = res.replace("#numero#", "125");
                return res;
            }
            case 1:
            case 17:
            case 18: {
                res = res.replace("#numero#", "125");
                return res;
            }
            case 2: {
                res = res.replace("#numero#", "842");
                return res;
            }
            case 14: {
                res = res.replace("#numero#", "842");
                return res;
            }
            case 8 : case 19: case 20:{
                res = res.replace("#numero#", "170");
                return res;
            }
        }
        return null;
    }

    private String getParamettersCamaraCompens(MeioPagamento mp) {
        StringBuffer sb = new StringBuffer();
        sb.append("idcamara=#idcamara#;");
        sb.append("descricao=#descricao#;");
        sb.append("idreal=#idreal#;");
        sb.append("idpessoajuridica=#idpessoajuridica#;");
        sb.append("contapagamento=#contapagamento#;");
        sb.append("contarecebimento=#contarecebimento#;");
        String res = sb.toString();

        //3,5,7,8
        switch (mp.getConfiguracao()) {
            case 14: {
                res = res.replace("#idreal#", String.valueOf(290));
                break;
            }
            case 15: {
                res = res.replace("#idreal#", String.valueOf(15));
                break;
            }
            case 17:
            case 18: {
                
                //SMART CARD
                res = res.replace("#idreal#", "SC");
                res = res.replace("#idcamara#", String.valueOf(mp.getConfiguracao()));
                res = res.replace("#descricao#", mp.getNome());
                res = res.replace("#idpessoajuridica#", String.valueOf(mp.getConfiguracao()));
                res = res.replace("#contarecebimento#", String.valueOf(14));
                res = res.replace("#contapagamento#", String.valueOf(14 * 2));
                return res;
            }
            case 7:{break;}
            case 16: {
                res = res.replace("#idreal#", "DBT");
                res = res.replace("#contarecebimento#", String.valueOf(14));
                res = res.replace("#contapagamento#", String.valueOf(14 * 2));
                res = res.replace("#idpessoajuridica#", String.valueOf(mp.getConfiguracao()));
                break;
            }

            case 19:{break;}
            case 20: {
                res = res.replace("#idreal#", "170");
                break;
            }
            case 23: {
                res = res.replace("#idreal#", "23");
                res = res.replace("#idcamara#", String.valueOf(mp.getConfiguracao()));
                res = res.replace("#descricao#", mp.getNome());
                res = res.replace("#idpessoajuridica#", String.valueOf(mp.getConfiguracao()));
                res = res.replace("#contarecebimento#", String.valueOf(mp.getConfiguracao()));
                res = res.replace("#contapagamento#", String.valueOf(mp.getConfiguracao()));
                return res;
            }
            case 1: case 2: case 3:{
            	return null;
            }
        }

        res = res.replace("#idcamara#", String.valueOf(mp.getConfiguracao()));
        res = res.replace("#descricao#", mp.getNome());
        res = res.replace("#idpessoajuridica#", String.valueOf(mp.getConfiguracao()));
        res = res.replace("#contarecebimento#", String.valueOf(mp.getConfiguracao()));
        res = res.replace("#contapagamento#", String.valueOf(mp.getConfiguracao() * 2));
        return res;
    }

    private String getParamettersMeioPagamentoInterop(MeioPagamento mp) {
        StringBuffer sb = new StringBuffer();
        sb.append("idmeiopagamentointeroperacao=#idmeiopagamentointeroperacao#;");
        sb.append("descricao=#descricao#;");
        sb.append("idreal=#idreal#;");
        sb.append("idgestor=#idgestor#;");
        sb.append("modelo=#modelo#;");
        sb.append("idmeiopagamento=#idmeiopagamento#;");

        String res = sb.toString();
        res = res.replace("#idmeiopagamentointeroperacao#", String.valueOf(mp.getConfiguracao()));
        res = res.replace("#idmeiopagamento#", String.valueOf(mp.getConfiguracao()));
        res = res.replace("#descricao#", mp.getNome());
        res = res.replace("#idgestor#", String.valueOf(mp.getConfiguracao()));
        switch (mp.getConfiguracao()) {
            case 14: {
                res = res.replace("#idreal#", String.valueOf(290));
                res = res.replace("#modelo#", "CGMP");
                return res;
            }
            case 15: {
                res = res.replace("#idreal#", String.valueOf(15));
                res = res.replace("#modelo#", "Visa");
                return res;
            }
            case 17:
            case 18: {
                res = res.replace("#idreal#", "SC");
                res = res.replace("#modelo#", "Smart");
                return res;
            }
            case 7: {
                res = res.replace("#idreal#", "DBT");
                res = res.replace("#modelo#", "DBT");
                return res;
            }
            case 19:
            case 20: {
                res = res.replace("#idreal#", "170");
                res = res.replace("#modelo#", "SGMP");
                return res;
            }
            case 23:
            case 101: {
                res = res.replace("#idreal#", mp.getConfiguracao() == 23 ? "23" : "101");
                res = res.replace("#modelo#", "VExp");
                return res;
            }
        }

        return null;
    }

    private String getParamettersMP(MeioPagamento mp) {
        StringBuffer sb = new StringBuffer();
        sb.append("idmeiopagamento=#idmeiopagamento#;");
        sb.append("descricao=#descricao#;");
        sb.append("idgestor=#idgestor#;");
        sb.append("iddesignacao=#iddesignacao#;");
        sb.append("alteravel=#alteravel#;");
        String res = sb.toString();

        res = res.replace("#idmeiopagamento#", String.valueOf(mp.getConfiguracao()));
        res = res.replace("#descricao#", mp.getNome());
        res = res.replace("#idgestor#", (mp.getConfiguracao()==4 || mp.getConfiguracao() == 2 || mp.getConfiguracao() == 3 || mp.getConfiguracao()==1)?"null":String.valueOf(mp.getConfiguracao()));
        res = res.replace("#iddesignacao#", mp.getIddesignacao());
        res = res.replace("#alteravel#", mp.isAlteravel() ? "1" : "0");
        
        return mp.getConfiguracao()!=16?res:null;
    }

    private String getParamettersGestor(MeioPagamento mp) {
        StringBuffer sb = new StringBuffer();
        sb.append("idgestor=#idgestor#;");
        sb.append("idreal=#idreal#;");
        sb.append("idpessoajuridica=#idpessoajuridica#;");
        sb.append("descricao=#descricao#;");
        sb.append("idcamara=#idcamara#;");
        String res = sb.toString();
        
        switch (mp.getConfiguracao()) {
            case 14: {
                res = res.replace("#idreal#", String.valueOf(290));
                break;
            }
            case 15: {
                res = res.replace("#idreal#", String.valueOf(15));
                break;
            }
            case 17:
            case 5:
            case 18: {
                res = res.replace("#idreal#", "SC");
                break;
            }
            case 7: {
                res = res.replace("#idreal#", "DBT");
                break;
            }
            case 19:
            case 20:
            case 8: {
                res = res.replace("#idreal#", "170");
                break;
            }
            case 23: {
                res = res.replace("#idreal#", "23");
                break;
            }
            case 1: case 2: case 3:{
                return null;
            }
            case 16:
                return null;
        }
        

        res = res.replace("#idgestor#", String.valueOf(mp.getConfiguracao()));

        res = res.replace("#idpessoajuridica#", String.valueOf(mp.getConfiguracao()));
        res = res.replace("#descricao#", mp.getNome());
        res = res.replace("#idcamara#", String.valueOf(mp.getConfiguracao()));
        return res;
    }

    private String getParamettersContaBanco(MeioPagamento mp) {
        StringBuffer sb = new StringBuffer();
        sb.append("idconta=#idconta1#;");
        sb.append("idorigem=#idorigem#;");
        sb.append("descricaobanco=#descricaobanco1#;");
        int config = mp.getConfiguracao();
        if(config >=14 && config <= 23){
        	sb.append("&&idconta=#idconta2#;");
            sb.append("idorigem=#idorigem#;");
            sb.append("descricaobanco=#descricaobanco2#;");
        }
        //sb.append("descricaobanco=#descricaobanco#;");
        //sb.append("agencia=#agencia#;");
        //sb.append("numeroconta=#numeroconta#;");
        //sb.append("enderecoagencia=#enderecoagencia#;");
        //sb.append("responsavelagencia=#responsavelagencia#;");
        //sb.append("telefoneagencia=#telefoneagencia#;");
        String res = sb.toString();
        res = res.replace("#idorigem#", String.valueOf(GeralConverte.IDS.GET_ID_CONCESSIONARIA(mp.getConcessionaria())));
        res = res.replace("#idconta1#", String.valueOf(mp.getConfiguracao()));
        res = res.replace("#idconta2#", String.valueOf(mp.getConfiguracao() * 2));//para garantir que a ID nao se repetira
        switch (mp.getConfiguracao()) {
            case 0: {
                res = res.replace("#numero#", "125");
                return res;
            }
            case 1: {
                res = res.replace("#numero#", "125");
                return res;
            }
            case 2: {
                res = res.replace("#numero#", "842");
                return res;
            }
            case 14: {
                res = res.replace("#numero#", "842");
                res = res.replace("#numero#", "125");
                res = res.replace("#descricaobanco1#", "Conta Recebimento CGMP");
                res = res.replace("#descricaobanco2#", "Conta Pagto CGMP");
                return res;
            }
            case 15: {
                res = res.replace("#numero#", "125");
                res = res.replace("#descricaobanco1#", "Conta Recebimento Visa Vale");
                res = res.replace("#descricaobanco2#", "Conta Pagamento Visa Vale");
                return res;
            }
            case 19:
            case 20: {
                res = res.replace("#numero#", "125");
                res = res.replace("#descricaobanco1#", "Conta Recebimento SGMP");
                res = res.replace("#descricaobanco2#", "Conta Pagamento SGMP");
                return res;
            }
            case 23: {
                res = res.replace("#numero#", "xxx");
                res = res.replace("#descricaobanco1#", "Via Express");
                return res;
            }
            case 16:{
                return null;
            }
        }
        return null;
    }

    /**
     * Monta a tabela a partir do modelo dados do BD.
     * @param nomeTabela Nome da tabela
     * @param valores Valores passados como parametros. Valores dos campos. Devem ser passados como "<b>campo=valor;campo2=valor2;campo...</b>
     * @return Tabela (ou lista de tabelas) com os valores preenchido
     */
    private Object getTable(String nomeTabela, String params) {
        if (params == null) {
            return null;
        }
        if (params.contains("&&")) {
            String[] vet = params.split("&&");
            List<Tabela> lst = new ArrayList<Tabela>();
            for (String valores : vet) {
                Tabela t = tdao.ObterPorVersaoENome(vid, nomeTabela);
                //Alterado somente campos que nao sao padroes.
                //Os demais campos ficam com valores padroes.
                Tabela tblg = (Tabela) t.replicate(null);
                for (Campo cp : tblg.getCampos()) {
                    if (cp != null) {
                        if (valores.toLowerCase().contains(cp.getNome().trim().toLowerCase())) {
                            String itens[] = valores.split(";");
                            for (String it : itens) {
                                String[] parametter = it.split("=");
                                if (parametter[0].toLowerCase().equals(cp.getNome().toLowerCase().trim())) {
                                    cp.setValor(parametter[1]);
                                }
                            }
                        }
                    }
                }
                lst.add(tblg);
            }
            //tdao.close();
            //tdao.clear();
            return lst;
        } else {
            String valores = params;
            Tabela t = tdao.ObterPorVersaoENome(vid, nomeTabela);
            //Alterado somente campos que nao sao padroes.
            //Os demais campos ficam com valores padroes.
            Tabela tblg = (Tabela) t.replicate(null);
            for (Campo cp : tblg.getCampos()) {
                if (cp != null) {
                    if (valores.toLowerCase().contains(cp.getNome().trim().toLowerCase())) {
                        String itens[] = valores.split(";");
                        for (String it : itens) {
                            String[] parametter = it.split("=");
                            if (parametter[0].toLowerCase().equals(cp.getNome().toLowerCase().trim())) {
                                cp.setValor(parametter[1]);
                            }
                        }
                    }
                }
            }
            //tdao.close();
            //tdao.clear();
            return tblg;
        }
    }
    private final static String pessoajuridica = "pessoajuridica";
    private final static String enderecopessoajuridica = "enderecopessoajuridica";
    private final static String contabanco = "contabanco";
    private final static String camaracompensacao = "camaracompensacao";
    private final static String gestor = "gestor";
    private final static String ProcessamentosMeioPagamento = "ProcessamentosMeioPagamento";
    private final static String meiopagamento = "meiopagamento";
    private static final String meiopagamentointeroperacao = "meiopagamentointeroperacao";
    private static final String pastatrabalhomeiopagamento = "pastatrabalhomeiopagamento";
    private static final String configuracaomeiopagamento = "configuracaomeiopagamento";
    private static final String temposmeiopagamento = "temposmeiopagamento";
    private static final String rotinasinteroperabilidade = "rotinasinteroperabilidade";
}
