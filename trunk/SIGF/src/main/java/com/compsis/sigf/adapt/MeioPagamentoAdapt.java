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

    public MeioPagamentoAdapt(MeioPagamento mp, int vid) {
        L.d(this.getClass().getName(), "Adaptando Meio de Pagamento");
        this.vid = vid;
        tabelas = new ArrayList<Tabela>();
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

            ret = getTable(meiopagamentointeroperacao, getParamettersMeioPagamentoInterop(mp));
            if (ret != null) {
                if (ret instanceof List) {
                    List<Tabela> lst = (List<Tabela>) ret;
                    tabelas.addAll(lst);
                } else if (ret instanceof Tabela) {
                    tabelas.add((Tabela) ret);
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

        //Ordena
        Collections.sort(tabelas);
        L.d(this.getClass().getName(), "Meio de pagamento adaptado e ordenado.");
    }

    public String getScripts() {
        return ManagementScript.getInstance().export(tabelas);
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
            case 7:
            case 16: {
                res = res.replace("#idreal#", "DBT");
                res = res.replace("#contarecebimento#", String.valueOf(14));
                res = res.replace("#contapagamento#", String.valueOf(14 * 2));
                res = res.replace("#idpessoajuridica#", String.valueOf(mp.getConfiguracao()));
                break;
            }

            case 19:
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

        String res = sb.toString();
        res = res.replace("#idmeiopagamentointeroperacao#", String.valueOf(mp.getConfiguracao()));
        res = res.replace("#descricao#", mp.getNome());
        res = res.replace("#idgestor#", String.valueOf(mp.getConfiguracao()));
        switch (mp.getConfiguracao()) {
            case 14: {
                res = res.replace("#idreal#", String.valueOf(290));
                res = res.replace("#modelo#", "290");
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
        sb.append("&&idconta=#idconta2#;");
        sb.append("idorigem=#idorigem#;");
        sb.append("descricaobanco=#descricaobanco2#;");
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
                res = res.replace("#descricaobanco1#", "Conta Recebimento Visa Vale");
                res = res.replace("#descricaobanco2#", "Conta Pagamento Visa Vale");
                return res;
            }
            case 15: {
                res = res.replace("#numero#", "125");
                res = res.replace("#descricaobanco1#", "Conta Recebimento CGMP");
                res = res.replace("#descricaobanco2#", "Conta Pagto CGMP");
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
    private final static String meiopagamento = "meiopagamento";
    private static final String meiopagamentointeroperacao = "meiopagamentointeroperacao";
    private static final String pastatrabalhomeiopagamento = "pastatrabalhomeiopagamento";
    private static final String configuracaomeiopagamento = "configuracaomeiopagamento";
    private static final String temposmeiopagamento = "temposmeiopagamento";
    private static final String rotinasinteroperabilidade = "rotinasinteroperabilidade";
}
