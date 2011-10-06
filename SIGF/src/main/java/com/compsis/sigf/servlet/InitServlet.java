package com.compsis.sigf.servlet;


import com.compsis.sigf.domain.BASE;
import com.compsis.sigf.domain.Categoria;
import com.compsis.sigf.domain.ComboBox;
import com.compsis.sigf.domain.MeioPagamento;
import com.compsis.sigf.domain.TipoCategoria;
import com.compsis.sigf.domain.TipoPista;
import com.compsis.sigf.domain.TipoTransacao;
import com.compsis.sigf.log.L;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.Properties;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Compsis
 * @author Lucas Israel
 * @see 04/08/2011
 * @version 1.0
 * 
 */
public class InitServlet extends HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        System.out.println("Iniciando Sistema em InitServlet");
        initParametters();
    }

    private String getFromFile(String fileName) {
        StringBuffer sb = new StringBuffer();
        try {
            URL resource = getClass().getClassLoader().getResource(fileName);
            File f = new File(resource.toURI());
            FileInputStream fis = new FileInputStream(f);
            BufferedReader in = new BufferedReader(new InputStreamReader(fis, "ISO-8859-1"));
            String line;
            while ((line = in.readLine()) != null) {
                sb.append(line);
                sb.append(" \n ");
            }
            in.close();
            return sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private String getDefaultsScripts() {
        return getFromFile("insertsPadroes.txt");
    }

    private String getGeralBrasil() {
        return getFromFile("SCRIPTS_BRASIL.txt");
    }

    private String getGeralNigeria() {
        return getFromFile("SCRIPTS_NIGERIA.txt");
    }

    private String getPracaNigeria() {
        return getFromFile("PRACA_NIGERIA.txt");
    }

    private String getPracaBrasil() {
        return getFromFile("PRACA_BRASIL.txt");
    }

    private String getConcessionariaBrasil() {
        return getFromFile("CONCESSIONARIA_BRASIL.txt");
    }

    private String getConcessionariaNigeria() {
        return getFromFile("CONCESSIONARIA_NIGERIA.txt");
    }

    private void loadScripts() {
        L.d(this.getClass().getName(), "Carregando Scripts Comuns");
        BASE.ConjuntosInserts.SCRIPT_COMUNS = getDefaultsScripts();
        BASE.ConjuntosInserts.SCRIPT_CONC_BRASIL = getConcessionariaBrasil();
        BASE.ConjuntosInserts.SCRIPT_CONC_NIGERIA = getConcessionariaNigeria();
        BASE.ConjuntosInserts.SCRIPT_GERAL_BRASIL = getGeralBrasil();
        BASE.ConjuntosInserts.SCRIPT_GERAL_NIGERIA = getGeralNigeria();
        BASE.ConjuntosInserts.SCRIPT_PRACA_BRASIL = getPracaBrasil();
        BASE.ConjuntosInserts.SCRIPT_PRACA_NIGERIA = getPracaNigeria();
        L.d(this.getClass().getName(), "Scripts Comuns foi carregados");
        //Versao vtemp = new Versao();
        //vtemp = ManagementScript.getInstance().importarFromSQL(BASE.ConjuntosInserts.SCRIPT_COMUNS, vtemp);
        //BASE.ConjuntosInserts.INSERTS_GERAIS = vtemp.getTabelas();
    }

    public void initParametters() {
        System.out.println(" ---{Iniciando}--- ");
        L.DEBUG_MODE = true;
        L.PRINT_STACK_TRACE = true;
        L.d(this.getClass().getName(), "Iniciando em InitServlet");
        System.out.println(" ---{Print}--- ");
        
        //Inicia configuracoes iniciais
        //BaseTemp.INIT_BASE();
        InputStream in = InitServlet.class.getClassLoader().getResourceAsStream("listas.properties");
        Properties prop = new Properties();
        try {
            prop.load(in);
            String outroId = prop.getProperty("outro.id");
            String outroDec = prop.getProperty("outro.dec");
            String outroEf = prop.getProperty("outro.ef");
            String outroRd = prop.getProperty("outro.rd");
            String outroAv = prop.getProperty("outro.av");
            String outroRm = prop.getProperty("outro.rm");
            String outroCgmp = prop.getProperty("outro.cgmp");
            String outroTipo = prop.getProperty("outro.tipo");
            String outroModelo = prop.getProperty("outro.modelo");
            String outroHabilita = prop.getProperty("outro.habilita.cassifica");


            String[] ids, descs, efs, rds, avs, rms, cgmps, tipos, modelos, habilitados;
            ids = outroId.split(";");
            descs = outroDec.split(";");
            efs = outroEf.split(";");
            rds = outroRd.split(";");
            avs = outroAv.split(";");
            rms = outroRm.split(";");
            cgmps = outroCgmp.split(";");
            tipos = outroTipo.split(";");
            modelos = outroModelo.split(";");
            habilitados = outroHabilita.split(";");

            BASE.LISTAS.CATEGORIAS = new ArrayList<Categoria>();
            for (int i = 0; i < ids.length; i++) {
                Categoria c = new Categoria();
                c.setId(null);
                c.setDescricao(descs[i]);
                c.setAv(Integer.parseInt(avs[i]));
                c.setEf(Integer.parseInt(efs[i]));
                c.setRd(Integer.parseInt(rds[i]));
                c.setRm(Integer.parseInt(rms[i]));
                c.setCgmp(Integer.parseInt(cgmps[i]));
                c.setModelo(modelos[i]);
                c.setTipo(Integer.parseInt(tipos[i]));
                BASE.LISTAS.CATEGORIAS.add(c);
            }


            BASE.LISTAS.TIPOS_CATEGORIA = new ArrayList<TipoCategoria>();
            String tipoCat = prop.getProperty("tipo.categorias");
            String tps[] = tipoCat.split(";");
            for (String s : tps) {
                String[] params = s.split(",");
                TipoCategoria tc = new TipoCategoria();
                tc.setId(Integer.parseInt(params[0]));
                tc.setNome(params[1]);
                BASE.LISTAS.TIPOS_CATEGORIA.add(tc);
            }

            BASE.LISTAS.TIPOS_PISTAS = new ArrayList<TipoPista>();
            String tipoPista = prop.getProperty("tipo.pista");
            tps = tipoPista.split(";");
            for (String s : tps) {
                String[] params = s.split(",");
                TipoPista tp = new TipoPista();
                tp.setId(Integer.parseInt(params[0]));
                tp.setNome(params[1]);
                BASE.LISTAS.TIPOS_PISTAS.add(tp);
            }


            String idiomas = prop.getProperty("lista.idiomas");
            tps = idiomas.split(";");
            BASE.LISTAS.IDIOMAS = new ArrayList<ComboBox>();
            for (String s : tps) {
                String[] params = s.split(",");
                ComboBox cb = new ComboBox();
                cb.setLabel(params[1]);
                cb.setValue(params[0]);
                BASE.LISTAS.IDIOMAS.add(cb);
            }


            String edicoesSO = prop.getProperty("lista.edicao.so");
            tps = edicoesSO.split(";");
            BASE.LISTAS.SO_EDICAO = new ArrayList<ComboBox>();
            for (String s : tps) {
                String[] params = s.split(",");
                ComboBox cb = new ComboBox();
                cb.setLabel(params[1]);
                cb.setValue(params[0]);
                BASE.LISTAS.SO_EDICAO.add(cb);
            }


            String sgbds = prop.getProperty("lista.sgbd");
            tps = sgbds.split(";");
            BASE.LISTAS.SGBDs = new ArrayList<ComboBox>();
            for (String s : tps) {
                String[] params = s.split(",");
                ComboBox cb = new ComboBox();
                cb.setLabel(params[1]);
                cb.setValue(params[0]);
                BASE.LISTAS.SGBDs.add(cb);
            }

            //lista.tipo.link
            String links = prop.getProperty("lista.tipo.link");
            tps = links.split(";");
            BASE.LISTAS.LINKS = new ArrayList<ComboBox>();
            for (String s : tps) {
                String[] params = s.split(",");
                ComboBox cb = new ComboBox();
                cb.setLabel(params[1]);
                cb.setValue(params[0]);
                BASE.LISTAS.LINKS.add(cb);
            }

            //Iniciando dados Fixos
            BASE.LISTAS.SO_VERSAO = new ArrayList<ComboBox>();
            {
                ComboBox cb = new ComboBox();
                cb.setValue("32");
                cb.setLabel("32 bits");
                BASE.LISTAS.SO_VERSAO.add(cb);
                ComboBox cb2 = new ComboBox();
                cb2.setValue("64");
                cb2.setLabel("64 bits");
                BASE.LISTAS.SO_VERSAO.add(cb2);
            }

            BASE.LISTAS.PERCENTUAL_CORRECAO_AUTOMATICA_CATEGORIAS_AMBIGUAS = new ArrayList<ComboBox>();
            {
                ComboBox cb = new ComboBox();
                cb.setValue("1");
                cb.setLabel("0% - Nenhuma transacao nao corrigida automaticamente");
                BASE.LISTAS.PERCENTUAL_CORRECAO_AUTOMATICA_CATEGORIAS_AMBIGUAS.add(cb);
                ComboBox cb2 = new ComboBox();
                cb2.setValue("2");
                cb2.setLabel("30% - 30% das transacoes sao corrigidas automaticamentes");
                BASE.LISTAS.PERCENTUAL_CORRECAO_AUTOMATICA_CATEGORIAS_AMBIGUAS.add(cb2);
                ComboBox cb3 = new ComboBox();
                cb3.setValue("3");
                cb3.setLabel("100% - Todas as transacoes serao corrigidas automaticamentes");
                BASE.LISTAS.PERCENTUAL_CORRECAO_AUTOMATICA_CATEGORIAS_AMBIGUAS.add(cb3);
            }

            BASE.LISTAS.TIPOS_TRANSACAO = new ArrayList<TipoTransacao>();
            {
                TipoTransacao tt = new TipoTransacao();
                tt.setId(1);
                tt.setAdquireImagem(false);
                tt.setNome("Transacoes Normais");
                BASE.LISTAS.TIPOS_TRANSACAO.add(tt);

                TipoTransacao tt2 = new TipoTransacao();
                tt2.setId(2);
                tt2.setAdquireImagem(true);
                tt2.setNome("Transaces com difereca de deteccao e classificacao");
                BASE.LISTAS.TIPOS_TRANSACAO.add(tt2);

                TipoTransacao tt3 = new TipoTransacao();
                tt3.setId(3);
                tt3.setAdquireImagem(true);
                tt3.setNome("Isentos");
                BASE.LISTAS.TIPOS_TRANSACAO.add(tt3);

                TipoTransacao tt4 = new TipoTransacao();
                tt4.setId(4);
                tt4.setAdquireImagem(true);
                tt4.setNome("Violaces");
                BASE.LISTAS.TIPOS_TRANSACAO.add(tt4);

                TipoTransacao tt5 = new TipoTransacao();
                tt5.setId(5);
                tt5.setAdquireImagem(true);
                tt5.setNome("Nao Pagantes");
                BASE.LISTAS.TIPOS_TRANSACAO.add(tt5);

                TipoTransacao tt6 = new TipoTransacao();
                tt6.setId(6);
                tt6.setAdquireImagem(true);
                tt6.setNome("Tag bloqueado");
                BASE.LISTAS.TIPOS_TRANSACAO.add(tt6);

                TipoTransacao tt7 = new TipoTransacao();
                tt7.setId(2);
                tt7.setAdquireImagem(true);
                tt7.setNome("Usuario Local");
                BASE.LISTAS.TIPOS_TRANSACAO.add(tt7);
            }

            //Carrega Meios de Pagamento (SUBIR DO BANCO DEPOIS)
            {
                StringBuffer sb = new StringBuffer();

                BASE.LISTAS.MEIOS_PAGAMENTO = new ArrayList<MeioPagamento>();
                MeioPagamento mNominal = new MeioPagamento(false, false);
                mNominal.setConfiguracao(1);
                mNominal.setId(1);
                mNominal.setIdgestor(null);
                mNominal.setProgramartarifa("0");
                mNominal.setIdmeiopagtotarifa("1");
                mNominal.setIddesignacao("1");
                mNominal.setAlteravel(false);
                mNominal.setNome("Nominal");
                mNominal.setObs("");
                BASE.LISTAS.MEIOS_PAGAMENTO.add(mNominal);

                BASE.LISTAS.MEIOS_PAGAMENTO = new ArrayList<MeioPagamento>();
                MeioPagamento mDinheiro = new MeioPagamento(false, false);
                mDinheiro.setConfiguracao(1);
                mDinheiro.setId(1);
                mDinheiro.setIdgestor(null);
                mDinheiro.setProgramartarifa("1");
                mDinheiro.setIdmeiopagtotarifa("1");
                mDinheiro.setIddesignacao("1");
                mDinheiro.setAlteravel(false);
                mDinheiro.setNome("Dinheiro");
                mDinheiro.setObs("");
                BASE.LISTAS.MEIOS_PAGAMENTO.add(mDinheiro);

                MeioPagamento mCheque = new MeioPagamento(false, false);
                mCheque.setConfiguracao(3);
                mCheque.setId(2);
                mCheque.setIdgestor(null);
                mCheque.setProgramartarifa("0");
                mCheque.setIdmeiopagtotarifa("1");
                mCheque.setIddesignacao("1");
                mCheque.setAlteravel(false);
                mCheque.setNome("Cheque");
                mCheque.setObs("");
                BASE.LISTAS.MEIOS_PAGAMENTO.add(mCheque);

                MeioPagamento mCupon = new MeioPagamento(false, false);
                mCupon.setConfiguracao(2);
                mCupon.setId(3);
                mCupon.setIdgestor(null);
                mCupon.setProgramartarifa("0");
                mCupon.setIdmeiopagtotarifa("1");
                mCupon.setIddesignacao("1");
                mCupon.setAlteravel(false);
                mCupon.setObs("");
                mCupon.setNome("Cupon");
                BASE.LISTAS.MEIOS_PAGAMENTO.add(mCupon);

                MeioPagamento mSmartInd = new MeioPagamento(true, false);
                mSmartInd.setConfiguracao(17);
                mSmartInd.setId(4);
                mSmartInd.setIdgestor("5");
                mSmartInd.setProgramartarifa("1");
                mSmartInd.setIdmeiopagtotarifa("17");
                mSmartInd.setIddesignacao("7");
                mSmartInd.setAlteravel(false);
                sb.setLength(0);
                mSmartInd.setNome("Smartcard Individual");
                sb.append("insert into pessoajuridica(cnpj, idpessoajuridica, razaosocial, inscricaoestadual, inscricaomunicipal, ativa, datainsercao) Values('xxxxxxxxxxx', 5, 'Smart Card', 'XXXXXXX', 'XXXXXXX', 1, sysdate);");
                sb.append("insert into enderecopessoajuridica(idpessoajuridica, idendereco, logradouro, numero, complemento, bairro, cidade, estado, pais, cep, datainsercao) values(5, 1, 'xxxxxxxxxxxxx', 842, 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'SP', 'BRASIL', 'XXXXXXXXX', dbo.trunc_date(getDate()));");
                sb.append("insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(1, 1, #concorigem#, 'Conta Recebimento CGMP', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');");
                sb.append("insert into camaracompensacao(idcamara, descricao, idreal, idpessoajuridica, situacaoprocentrada,situacaoprocsaida, contapagamento, contarecebimento, datahoracadastro, datahoraultimaatualizacao,datainsercao) values(5, 'Camara Smart Card', 'SC', 5, 1, 1, 1, 2, sysdate, sysdate, sysdate);");
                sb.append("insert into gestor(idgestor, idreal, idpessoajuridica, descricao, idcamara, tipolistavalidacao, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(5, 'SC', 5, 'SGSC', 5,1, sysdate, NULL, sysdate);");
                mSmartInd.setScriptsDependentes(sb.toString());
                mSmartInd.setObs("");
                BASE.LISTAS.MEIOS_PAGAMENTO.add(mSmartInd);

                MeioPagamento mSmartEmp = new MeioPagamento(true, false);
                mSmartEmp.setConfiguracao(18);
                mSmartEmp.setNome("Smartcard Empresarial");
                mSmartEmp.setIdgestor("5");
                mSmartEmp.setProgramartarifa("1");
                mSmartEmp.setIdmeiopagtotarifa("18");
                mSmartEmp.setIddesignacao("6");
                mSmartEmp.setAlteravel(true);
                mSmartEmp.setObs("");
                sb.setLength(0);
                sb.append("insert into pessoajuridica(cnpj, idpessoajuridica, razaosocial, inscricaoestadual, inscricaomunicipal, ativa, datainsercao) Values('xxxxxxxxxxx', 5, 'Smart Card', 'XXXXXXX', 'XXXXXXX', 1, sysdate);");
                sb.append("insert into enderecopessoajuridica(idpessoajuridica, idendereco, logradouro, numero, complemento, bairro, cidade, estado, pais, cep, datainsercao) values(5, 1, 'xxxxxxxxxxxxx', 842, 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'SP', 'BRASIL', 'XXXXXXXXX', dbo.trunc_date(getDate()));");
                sb.append("insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(1, 1, #concorigem#, 'Conta Recebimento CGMP', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');");
                sb.append("insert into camaracompensacao(idcamara, descricao, idreal, idpessoajuridica, situacaoprocentrada,situacaoprocsaida, contapagamento, contarecebimento, datahoracadastro, datahoraultimaatualizacao,datainsercao) values(5, 'Camara Smart Card', 'SC', 5, 1, 1, 1, 2, sysdate, sysdate, sysdate);");
                sb.append("insert into gestor(idgestor, idreal, idpessoajuridica, descricao, idcamara, tipolistavalidacao, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(5, 'SC', 5, 'SGSC', 5,1, sysdate, NULL, sysdate);");
                mSmartEmp.setScriptsDependentes(sb.toString());
                mSmartEmp.setId(5);
                BASE.LISTAS.MEIOS_PAGAMENTO.add(mSmartEmp);

                MeioPagamento promessa = new MeioPagamento(true, false);
                promessa.setConfiguracao(4);
                promessa.setNome("Promessa Pgto");
                promessa.setIdgestor(null);
                promessa.setProgramartarifa("1");
                promessa.setIdmeiopagtotarifa("0");
                promessa.setIddesignacao("2");
                promessa.setAlteravel(true);
                promessa.setObs("");
                sb.setLength(0);
                sb.append("insert into DesignacaoMeioPagamento(IdDesignacao,Descricao,DataInsercao) values(2,'Promessa Pagto',dbo.trunc_date(getDate()));");
                promessa.setScriptsDependentes(sb.toString());
                promessa.setId(4);
                BASE.LISTAS.MEIOS_PAGAMENTO.add(promessa);

                MeioPagamento mVia = new MeioPagamento(false, false);
                mVia.setId(6);
                mVia.setNome("Via Fácil / Sem Parar");
                mVia.setIdgestor("3");
                mVia.setProgramartarifa("1");
                mVia.setIdmeiopagtotarifa("14");
                mVia.setIddesignacao("5");
                mVia.setAlteravel(true);
                mVia.setObs("");
                sb.setLength(0);
                sb.append("insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(1, 1, #concorigem#, 'Conta Recebimento CGMP', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');");
                sb.append("insert into camaracompensacao(idcamara, descricao, idreal, idpessoajuridica, situacaoprocentrada,situacaoprocsaida, contapagamento, contarecebimento, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(3, 'CGMP', '290', 3, 1, 1, 1, 2, dbo.trunc_date(getDate()), dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));");
                sb.append("insert into gestor(idgestor, idreal, idpessoajuridica, descricao, idcamara, tipolistavalidacao, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(3, '290' , 3, 'CGMP',    3, 1, dbo.trunc_date(getDate()), null, dbo.trunc_date(getDate()));");
                mVia.setScriptsDependentes(sb.toString());
                mVia.setConfiguracao(14);
                mVia.setPosScripts("insert into meiopagamentointeroperacao(idmeiopagamentointeroperacao, descricao, idmeiopagamento, idreal, idgestor, recebeviolador, datahoraultimaatualizacao, ativa, modelo, datahoracadastro, datainsercao, leadtime, flagpermitedesconto, flagexibe, ordem) values (14, 'ViaFácil/SemParar', 14, '290', 3, 1, dbo.trunc_date(getDate()), 0, 'CGMP', dbo.trunc_date(getDate()), dbo.trunc_date(getDate()), 0, 1, 1, 1);");
                BASE.LISTAS.MEIOS_PAGAMENTO.add(mVia);

                MeioPagamento dbtrans = new MeioPagamento(false, false);
                dbtrans.setId(10);
                dbtrans.setNome("Vale Pedágio Dbtrans");
                dbtrans.setObs("");
                dbtrans.setIdgestor("7");
                dbtrans.setProgramartarifa("0");
                dbtrans.setIdmeiopagtotarifa("1");
                dbtrans.setIddesignacao("1");
                dbtrans.setAlteravel(false);
                sb.setLength(0);
                sb.append("insert into pessoajuridica(cnpj, idpessoajuridica, razaosocial, inscricaoestadual, inscricaomunicipal, ativa, datainsercao) Values('xxxxxxxxxxx', 7, 'DBTrans', 'XXXXXXX', 'XXXXXXX', 1, sysdate);");
                sb.append("insert into enderecopessoajuridica(idpessoajuridica, idendereco, logradouro, numero, complemento, bairro, cidade, estado, pais, cep, datainsercao) values(7, 1, 'xxxxxxxxxxxxx', 842, 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'SP', 'BRASIL', 'XXXXXXXXX', dbo.trunc_date(getDate()));");
                sb.append("insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(1, 1, #concorigem#, 'Conta Recebimento CGMP', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');");
                sb.append("insert into camaracompensacao(idcamara, descricao, idreal, idpessoajuridica, situacaoprocentrada,situacaoprocsaida, contapagamento, contarecebimento, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(7, 'Nível 2 DBTtrans', 'DBT', 7, 1, 1, 1, 2, dbo.trunc_date(getdate()), dbo.trunc_date(getdate()), dbo.trunc_date(getdate()))");
                sb.append("insert into gestor(idgestor, idreal, idpessoajuridica, descricao, idcamara, tipolistavalidacao, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(7, 'DBT' , 7, 'DBTrans', 7, 1, dbo.trunc_date(getdate()), null, dbo.trunc_date(getdate()));");
                dbtrans.setPosScripts("insert into meiopagamentointeroperacao(idmeiopagamentointeroperacao, descricao, idmeiopagamento, idreal, idgestor, recebeviolador, datahoraultimaatualizacao, ativa, modelo, datahoracadastro, datainsercao, leadtime, flagpermitedesconto, flagexibe, ordem) values (16,'Cupom Vale Pedágio Dbtrans',16,'CDBT',7,0,dbo.trunc_date(getdate()),1,'CDBT',dbo.trunc_date(getdate()),dbo.trunc_date(getdate()),0,0,0,3);");
                dbtrans.setScriptsDependentes(sb.toString());
                dbtrans.setConfiguracao(16);
                dbtrans.setObs("");
                BASE.LISTAS.MEIOS_PAGAMENTO.add(dbtrans);

                MeioPagamento vvp = new MeioPagamento(true, true);
                vvp.setConfiguracao(15);
                vvp.setNome("Visa Vale Pedágio");
                vvp.setIdgestor("4");
                vvp.setProgramartarifa("0");
                vvp.setIdmeiopagtotarifa("0");
                vvp.setIddesignacao("10");
                vvp.setAlteravel(false);
                sb.setLength(0);
                sb.append("insert into pessoajuridica(cnpj, idpessoajuridica, razaosocial, inscricaoestadual, inscricaomunicipal, ativa, datainsercao) Values('xxxxxxxxxxx', 4, 'Visa', 'XXXXXXX', 'XXXXXXX', 1, sysdate);");
                sb.append("insert into enderecopessoajuridica(idpessoajuridica, idendereco, logradouro, numero, complemento, bairro, cidade, estado, pais, cep, datainsercao) values(4, 1, 'xxxxxxxxxxxxx', 842, 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'SP', 'BRASIL', 'XXXXXXXXX', dbo.trunc_date(getDate()));");
                sb.append("insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(3, 1, #concorigem#, 'Conta Recebimento Visa Vale', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');");
                sb.append("insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(4, 1, #concorigem#, 'Conta Pagamento Visa Vale', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');");
                sb.append("insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(23, 1, #concorigem#, 'Conta Via Expressa', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');");
                sb.append("insert into camaracompensacao(idcamara, descricao, idreal, idpessoajuridica, situacaoprocentrada,situacaoprocsaida, contapagamento, contarecebimento, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(4, 'Visa', 'Visa', 4, 1, 1, 1, 2, dbo.trunc_date(getDate()), dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));");
                sb.append("insert into gestor(idgestor, idreal, idpessoajuridica, descricao, idcamara, tipolistavalidacao, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(4, 'Visa', 4, 1, dbo.trunc_date(getDate()), null, dbo.trunc_date(getDate()));");
                vvp.setPosScripts("insert into meiopagamentointeroperacao(idmeiopagamentointeroperacao, descricao, idmeiopagamento, idreal, idgestor, recebeviolador, datahoraultimaatualizacao, ativa, modelo, datahoracadastro, datainsercao, leadtime, flagpermitedesconto, flagexibe, ordem) values (15, 'Visa Vale Pedágio', 15, 'Visa', 4, 0, dbo.trunc_date(getdate()), 0, 'Visa', dbo.trunc_date(getdate()), dbo.trunc_date(getdate()), 0, 0, 0, 2);");
                vvp.setScriptsDependentes(sb.toString());

                vvp.setId(11);
                vvp.setObs("");
                BASE.LISTAS.MEIOS_PAGAMENTO.add(vvp);

                MeioPagamento scgmpPF = new MeioPagamento(false, false);
                scgmpPF.setNome("SGMP PF");
                scgmpPF.setConfiguracao(19);
                scgmpPF.setObs("");
                scgmpPF.setIdgestor("8");
                scgmpPF.setProgramartarifa("1");
                scgmpPF.setIdmeiopagtotarifa("19");
                scgmpPF.setIddesignacao("5");
                scgmpPF.setAlteravel(true);
                sb.setLength(0);
                sb.append("insert into pessoajuridica(cnpj, idpessoajuridica, razaosocial, inscricaoestadual, inscricaomunicipal, ativa, datainsercao) values('xxxxxxxxxxx', 3, 'CGMP', 'XXXXXXX', 'XXXXXXX', 1, dbo.trunc_date(getDate()));");
                sb.append("insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(1, 1, #concorigem#, 'Conta Recebimento CGMP', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');");
                sb.append("insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(2, 1, #concorigem#, 'Conta Pagto CGMP', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');");
                sb.append("insert into enderecopessoajuridica(idpessoajuridica, idendereco, logradouro, numero, complemento, bairro, cidade, estado, pais, cep, datainsercao) values(3, 1, 'xxxxxxxxxxxxx', 842, 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'SP', 'BRASIL', 'XXXXXXXXX', dbo.trunc_date(getDate()));");
                sb.append("insert into camaracompensacao(idcamara, descricao, idreal, idpessoajuridica, situacaoprocentrada,situacaoprocsaida, contapagamento, contarecebimento, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(3, 'CGMP', '290', 3, 1, 1, 1, 2, dbo.trunc_date(getDate()), dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));");
                sb.append("insert into gestor(idgestor, idreal, idpessoajuridica, descricao, idcamara, tipolistavalidacao, datahoracadastro, datahoraultimaatualizacao, datainsercao) values (8, '170', 8, 'SGMP', 8, 0, trunc(sysdate), trunc(sysdate), trunc(sysdate));");
                scgmpPF.setScriptsDependentes(sb.toString());

                BASE.LISTAS.MEIOS_PAGAMENTO.add(scgmpPF);


                MeioPagamento scgmpPJ = new MeioPagamento(false, false);
                scgmpPJ.setNome("SGGMP PJ");
                scgmpPJ.setConfiguracao(20);
                scgmpPJ.setObs("");
                sb.setLength(0);
                scgmpPJ.setObs("");
                scgmpPJ.setIdgestor("8");
                scgmpPJ.setProgramartarifa("1");
                scgmpPJ.setIdmeiopagtotarifa("20");
                scgmpPJ.setIddesignacao("5");
                sb.append("insert into pessoajuridica(cnpj, idpessoajuridica, razaosocial, inscricaoestadual, inscricaomunicipal, ativa, datainsercao) values('xxxxxxxxxxx', 3, 'CGMP', 'XXXXXXX', 'XXXXXXX', 1, dbo.trunc_date(getDate()));");
                sb.append("insert into enderecopessoajuridica(idpessoajuridica, idendereco, logradouro, numero, complemento, bairro, cidade, estado, pais, cep, datainsercao) values(3, 1, 'xxxxxxxxxxxxx', 842, 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'SP', 'BRASIL', 'XXXXXXXXX', dbo.trunc_date(getDate()));");
                sb.append("insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(1, 1, #concorigem#, 'Conta Recebimento CGMP', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');");
                sb.append("insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(2, 1, #concorigem#, 'Conta Pagto CGMP', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');");
                sb.append("insert into camaracompensacao(idcamara, descricao, idreal, idpessoajuridica, situacaoprocentrada,situacaoprocsaida, contapagamento, contarecebimento, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(3, 'CGMP', '290', 3, 1, 1, 1, 2, dbo.trunc_date(getDate()), dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));");
                sb.append("insert into gestor(idgestor, idreal, idpessoajuridica, descricao, idcamara, tipolistavalidacao, datahoracadastro, datahoraultimaatualizacao, datainsercao) values (8, '170', 8, 'SGMP', 8, 0, trunc(sysdate), trunc(sysdate), trunc(sysdate));");
                scgmpPJ.setScriptsDependentes(sb.toString());

                BASE.LISTAS.MEIOS_PAGAMENTO.add(scgmpPJ);


                MeioPagamento viaExpressa = new MeioPagamento(false, false);
                viaExpressa.setNome("Via Expressa");
                viaExpressa.setConfiguracao(23);
                viaExpressa.setObs("");
                viaExpressa.setObs("");
                viaExpressa.setIdgestor("23");
                viaExpressa.setProgramartarifa("1");
                viaExpressa.setIdmeiopagtotarifa("1");
                viaExpressa.setIddesignacao("5");
                viaExpressa.setAlteravel(true);
                sb.setLength(0);
                sb.append("insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(23, 1, 76014, 'Conta Via Expressa', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');");
                sb.append("insert into camaracompensacao(idcamara, descricao, idreal, idpessoajuridica, situacaoprocentrada, situacaoprocsaida, contapagamento, contarecebimento, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(23, 'Via Expressa', '23', 23, 1, 1, 23, 23, dbo.trunc_date(getDate()), dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));");
                sb.append("insert into gestor(idgestor, idreal, idpessoajuridica, descricao, idcamara, tipolistavalidacao, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(23, '23', 23, 'Via Expressa', 23, 1, dbo.trunc_date(getdate()), null, dbo.trunc_date(getdate()));");
                viaExpressa.setPosScripts("insert into meiopagamentointeroperacao(idmeiopagamentointeroperacao, descricao, idmeiopagamento, idreal, idgestor, recebeviolador, datahoraultimaatualizacao, ativa, modelo, datahoracadastro, datainsercao, leadtime, flagpermitedesconto, flagexibe, ordem) values (23, 'Via Expressa', 23, '23', 23, 0, dbo.trunc_date(getDate()), 1, 'VExp', dbo.trunc_date(getDate()), dbo.trunc_date(getDate()), 0, 0, 1, 3);");
                viaExpressa.setScriptsDependentes(sb.toString());

                BASE.LISTAS.MEIOS_PAGAMENTO.add(viaExpressa);


                //... Carrega os meios de pagamentos do BANCO
            }
            in.close();

        } catch (IOException ex) {
            L.d(this.getClass().getName(), ex);
        } finally {
            try {
                in.close();
            } catch (IOException ex1) {
                L.d(this.getClass().getName(), ex1);
            }
        }


        try {
            //Carrega Scritpts fixos
            new Thread(new Runnable() {

                @Override
                public void run() {
                    loadScripts();
                }
            }).start();
        } catch (Exception e) {
            e.printStackTrace();
        }
        L.d(this.getClass().getName(), "InitServlet terminado");
    }

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=ISO-8859-1");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InitServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InitServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
