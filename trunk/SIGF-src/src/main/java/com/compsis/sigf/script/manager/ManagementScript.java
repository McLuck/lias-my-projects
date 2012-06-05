/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.compsis.sigf.script.manager;

import br.com.mcluck.asynchronously.Utils.Factory;
import br.com.mcluck.asynchronously.annotation.Asynchronous;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.CampoDAO;
import com.compsis.sigf.dao.TabelaDAO;
import com.compsis.sigf.dao.VersaoDAO;
import com.compsis.sigf.domain.Campo;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.domain.Versao;
import com.compsis.sigf.log.L;
import com.compsis.sigf.utils.UtilidadesGenericas;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.security.CodeSource;
import java.security.ProtectionDomain;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lucas Israel
 */
public class ManagementScript {

    private  TabelaDAO tdao = (TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);
    private  CampoDAO cdao = (CampoDAO) AFactoryDao.getInstance(CampoDAO.class);
    private  VersaoDAO vdao = (VersaoDAO) AFactoryDao.getInstance(VersaoDAO.class);
    private static ManagementScript instance;
   
    
    public static ManagementScript getInstance(){
        if(instance==null){
            try {
                instance = (ManagementScript)Factory.getInstance(new ManagementScript());
            } catch (InstantiationException ex) {
                Logger.getLogger(ManagementScript.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(ManagementScript.class.getName()).log(Level.SEVERE, null, ex);
            }finally{
                if(instance==null){
                    System.err.println("Devolvendo instancia sem suporte a @Asynchronous.");
                    return new ManagementScript();
                }
            }
        }
        return instance;
    }
    
    public String getDefaults(){
        //load insertsPadroes.txt
        Class cls = this.getClass();
        ProtectionDomain pDomain = cls.getProtectionDomain();
        CodeSource cSource = pDomain.getCodeSource();
        URL loc = cSource.getLocation();
        
        String path = loc.getFile();
        path += "insertsPadroes.txt";
        
        File f = new File(path);

        StringBuffer sb = new StringBuffer();
        try {
            FileInputStream fis = new FileInputStream(f);
            BufferedReader in = new BufferedReader(new InputStreamReader(fis, "ISO-8859-1"));
            String line;
            while ((line = in.readLine()) != null) {
                sb.append(line);
            }
            in.close();
            return sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private Tabela salvarTabela(Tabela table) {
        table = (Tabela) tdao.salvar(table);
        return table;
    }

    private  Campo salvarCampo(Campo campo) {
        campo = (Campo) cdao.salvar(campo);
        return campo;
    }

    private  Versao salvarVersao(Versao versao) {
        versao = (Versao) vdao.salvar(versao);
        return versao;
    }

    public void importar(String script, String nomeVersao, int vs) {
        Versao versao = new Versao();
        versao.setNome(nomeVersao);
        versao.setVersao(vs);
        versao.setTabelas(new ArrayList<Tabela>());

        String[] sqls = script.split("\\);");
        for (String sql : sqls) {
            if (!sql.trim().startsWith("--") && !sql.trim().equals("") && !sql.equals(" ") && !sql.trim().equals("commit")) {
                System.out.println("Salvando " + sql);
                try {
                    //insert into perfiloperador(idperfil, idoperador, datainsercao) values(0, 999999999, dbo.trunc_date(getDate()));
                    sql = sql.toLowerCase().replace("insert into ", "");
                    String prs[] = sql.toLowerCase().split("values");
                    String cmp = prs[0];
                    String vlr = prs[1];
                    prs = cmp.split("\\(");
                    String tabela = prs[0];
                    cmp = cmp.replace(tabela, "");
                    cmp = cmp.trim();
                    tabela = tabela.trim();

                    Tabela t = new Tabela();
                    t.setNome(tabela);
                    t.setVersao(versao);
                    t.setCampos(new ArrayList<Campo> ());

                    vlr = vlr.trim();
                    if (cmp.startsWith("(")) {
                        cmp = cmp.substring(1, cmp.length());
                    }
                    if (cmp.endsWith(")")) {
                        cmp = cmp.substring(0, cmp.length() - 1);
                    }

                    if (vlr.startsWith("(")) {
                        vlr = vlr.substring(1, vlr.length());
                    }
                    if (vlr.endsWith(");")) {
                        vlr = vlr.substring(0, vlr.length() - 2);
                    }

                    String[] campos = cmp.split(",");
                    String[] valores = vlr.split(",");

                    for (int i = 0; i < campos.length; i++) {
                        Campo c = new Campo();
                        c.setNome(campos[i].trim());
                        c.setValor(valores[i].trim());
                        c.setTabela(t);
                        t.getCampos().add(c);
                    }
                    versao.getTabelas().add(t);
                } catch (Exception e) {
                    //System.err.println("Erro ao adicionar um script.");
                    System.err.println("Erro no Script: " + sql);
                    //e.printStackTrace();
                }
            }
        }
        vdao.salvar(versao);
        vdao.commit();
        vdao.close();
    }
    
    public Versao importarFromSQL(String script, String nomeVersao, int vs) {
        Versao versao = new Versao();
        versao.setNome(nomeVersao);
        versao.setVersao(vs);
        versao.setTabelas(new ArrayList<Tabela>());

        String[] sqls = script.split("\\);");
        for (String sql : sqls) {
            if (!sql.trim().startsWith("--") && !sql.trim().equals("") && !sql.equals(" ") && !sql.trim().equals("commit")) {
                System.out.println("Salvando " + sql);
                try {
                    sql = sql.toLowerCase().trim().replace("insert into ", "");
                    sql = sql.toLowerCase().trim().replace("insert  into ", "");
                    sql = sql.toLowerCase().trim().replace("insert   into ", "");
                    String prs[] = sql.toLowerCase().split("values");
                    String cmp = prs[0];
                    String vlr = prs[1];
                    prs = cmp.split("\\(");
                    String tabela = prs[0];
                    cmp = cmp.replace(tabela, "");
                    cmp = cmp.trim();
                    tabela = tabela.trim();

                    Tabela t = new Tabela();
                    t.setNome(tabela);
                    t.setVersao(versao);
                    t.setCampos(new ArrayList<Campo>());

                    vlr = vlr.trim();
                    if (cmp.startsWith("(")) {
                        cmp = cmp.substring(1, cmp.length());
                    }
                    if (cmp.endsWith(")")) {
                        cmp = cmp.substring(0, cmp.length() - 1);
                    }

                    if (vlr.startsWith("(")) {
                        vlr = vlr.substring(1, vlr.length());
                    }
                    if (vlr.endsWith(");")) {
                        vlr = vlr.substring(0, vlr.length() - 2);
                    }

                    String[] campos = cmp.split(",");
                    String[] valores = vlr.split(",");

                    for (int i = 0; i < campos.length; i++) {
                        Campo c = new Campo();
                        c.setNome(campos[i].trim());
                        c.setValor(valores[i].trim());
                        c.setTabela(t);
                        t.getCampos().add(c);
                    }
                    versao.getTabelas().add(t);
                } catch (Exception e) {
                    //System.err.println("Erro ao adicionar um script.");
                    System.err.println("Erro no Script: " + sql);
                    //e.printStackTrace();
                }
            }
        }
        return versao;
    }
    
    public Versao importarFromSQL(String script, Versao versao) {
        String[] sqls = script.split("\\);");
        for (String sql : sqls) {
            if (!sql.trim().startsWith("--") && !sql.trim().startsWith("#") && !sql.trim().equals("") && !sql.equals(" ") && !sql.trim().equals("commit")) {
                System.out.println("Salvando " + sql);
                try {
                    sql = sql.toLowerCase().trim().replace("insert into ", "");
                    sql = sql.toLowerCase().trim().replace("insert  into ", "");
                    sql = sql.toLowerCase().trim().replace("insert   into ", "");
                    String prs[] = sql.toLowerCase().split("values");
                    String cmp = prs[0];
                    String vlr = prs[1];
                    prs = cmp.split("\\(");
                    String tabela = prs[0];
                    cmp = cmp.replace(tabela, "");
                    cmp = cmp.trim();
                    tabela = tabela.trim();

                    Tabela t = new Tabela();
                    t.setNome(tabela);
                    t.setVersao(versao);
                    t.setCampos(new ArrayList<Campo>());

                    vlr = vlr.trim();
                    if (cmp.startsWith("(")) {
                        cmp = cmp.substring(1, cmp.length());
                    }
                    if (cmp.endsWith(")")) {
                        cmp = cmp.substring(0, cmp.length() - 1);
                    }

                    if (vlr.startsWith("(")) {
                        vlr = vlr.substring(1, vlr.length());
                    }
                    if (vlr.endsWith(");")) {
                        vlr = vlr.substring(0, vlr.length() - 2);
                    }

                    String[] campos = cmp.split(",");
                    String[] valores = vlr.split(",");

                    for (int i = 0; i < campos.length; i++) {
                        Campo c = new Campo();
                        c.setNome(campos[i].trim());
                        c.setValor(valores[i].trim());
                        c.setTabela(t);
                        t.getCampos().add(c);
                    }
                    versao.getTabelas().add(t);
                } catch (Exception e) {
                    //System.err.println("Erro ao adicionar um script.");
                    System.err.println("Erro no Script: " + sql);
                    //e.printStackTrace();
                }
            }
        }
        return versao;
    }
    
    public List<Versao> SPLIT_TABELAS(Versao v){
        List<Versao> lista = new ArrayList<Versao>();
        for(Tabela t : v.getTabelas()){
            if(t==null)continue;
            boolean enc = false;
            for(Versao vs : lista){
                if(vs==null)continue;
                if(!vs.getTabelas().isEmpty()){
                    if(vs.getTabelas().get(0).getNome().equals(t.getNome())){
                        vs.getTabelas().add(t);
                        enc = true;
                        break;
                    }
                }
            }
            if(!enc){
                Versao vs = new Versao();
                vs.setId(v.getId());
                vs.setNome(v.getNome());
                vs.setVersao(v.getVersao());
                vs.setTabelas(new ArrayList<Tabela>());
                vs.getTabelas().add(t);
                lista.add(vs);
            }
        }
        return lista;
    }
    
    public void contains(Versao v, List<Versao> lista){
        
    }

    public String exportar(int versao) {
        run = true;
        VersaoDAO dao = (VersaoDAO) AFactoryDao.getInstance(VersaoDAO.class);
        List<Versao> vlist = (List<Versao>) dao.getByVersao(versao);
        Versao v = null;
        if (vlist.isEmpty()) {
            return "Versao nao existe";
        } else {
            v = vlist.get(0);
        }



        List<Tabela> lista = v.getTabelas();


        StringBuffer sb = new StringBuffer();

        sb.append("-- ATENCAO -> GERADO AUTOMATICAMENTE \n\r");

        for (Tabela t : lista) {
            if (t == null) {
                continue;
            }
            StringBuilder sb2 = new StringBuilder();
            List<Campo> campos = t.getCampos();
            sb.append("INSERT INTO ");
            sb.append(t.getNome());
            sb.append(" (");
            boolean frt = true;
            for (Campo cp : campos) {
                if (cp == null) {
                    continue;
                }
                if (!frt) {
                    sb.append(", ");
                }
                
                sb.append(cp.getNome());
                
                if (frt) {
                    frt = false;
                } else {
                    sb2.append(", ");
                }
                sb2.append(cp.getValor());
            }
            sb.append(") VALUES (");
            sb.append(sb2.toString());
            sb.append(");\n\r");
            sb2 = null;
        }

        //sb.append(getDefaults());
        sb.append("commit");
        run = false;
        return sb.toString();
    }
    
    public String export(List<Tabela> lista){
        L.d(this.getClass().getName() , "Iniciando export de lista de tabela. Tamanho da Lista: "+lista.size());
        StringBuffer sb = new StringBuffer();
        
        for (Tabela t : lista) {
            if (t == null) {
                continue;
            }
            StringBuilder sb2 = new StringBuilder();
            List<Campo> campos = t.getCampos();
            sb.append("INSERT INTO ");
            sb.append(t.getNome());
            sb.append(" (");
            boolean frt = true;
            for (Campo cp : campos) {
                if (cp == null) {
                    continue;
                }
                if (!frt) {
                    sb.append(", ");
                }
                
                sb.append(cp.getNome());
                
                if (frt) {
                    frt = false;
                } else {
                    sb2.append(", ");
                }
                if(cp.getNome().equals("valor")){
                    sb2.append("'");
                    sb2.append(cp.getValor());
                    sb2.append("'");
                }else{
                    sb2.append(cp.getValor());
                }
            }
            sb.append(") VALUES (");
            sb.append(sb2.toString());
            sb.append(");");
            sb.append(UtilidadesGenericas.LINE_BREAK);
            sb2 = null;
        }
        //sb.append(getDefaults());
        //sb.append("commit");
        run = false;
        L.d(this.getClass().getName() , "Parse de List<Tabela> para String concluido.");
        return sb.toString();
    }
    public String export(Set<Tabela> lista){
        L.d(this.getClass().getName() , "Iniciando export de Set de tabela. Tamanho da Lista: "+lista.size());
        StringBuffer sb = new StringBuffer();


        for (Tabela t : lista) {
            if (t == null) {
                continue;
            }
            StringBuilder sb2 = new StringBuilder();
            List<Campo> campos = t.getCampos();
            sb.append("INSERT INTO ");
            sb.append(t.getNome());
            sb.append(" (");
            boolean frt = true;
            for (Campo cp : campos) {
                if (cp == null) {
                    continue;
                }
                if (!frt) {
                    sb.append(", ");
                }
                
                sb.append(cp.getNome());
                
                if (frt) {
                    frt = false;
                } else {
                    sb2.append(", ");
                }
                if(cp.getNome().equals("valor")){
                    sb2.append("'");
                    sb2.append(cp.getValor());
                    sb2.append("'");
                }else{
                    sb2.append(cp.getValor());
                }
            }
            sb.append(") VALUES (");
            sb.append(sb2.toString());
            sb.append(");").append(UtilidadesGenericas.LINE_BREAK);
            sb2 = null;
        }
        //sb.append(getDefaults());
        //sb.append("commit");
        run = false;
        L.d(this.getClass().getName() , "Parse de Set<Tabela> para String concluido.");
        return sb.toString();
    }
    
    private boolean run = true;
    
    @Asynchronous
    public void gc(){
        while(run){
            try {
                //Roda  GC a cada 10 seg
                Thread.sleep(10000);
            } catch (InterruptedException ex) {
                Logger.getLogger(ManagementScript.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.err.println("Request Garbage Collector...");
            System.gc();
        }
    }

    public void Salvar(String nome, String content) {
        try {
            FileOutputStream fos = new FileOutputStream(new File(nome));
            BufferedWriter out = new BufferedWriter(new OutputStreamWriter(fos, "ISO-8859-1"));
            out.write(content);
            out.flush();
            out.close();
        } catch (Exception ee) {
            ee.printStackTrace();
        }
    }

    @Asynchronous
    public void copyVersao(int from, int to, String nomeTo) throws InstantiationException, IllegalAccessException {
        VersaoDAO dao = (VersaoDAO) AFactoryDao.getInstance(VersaoDAO.class);
        List<Versao> vlist = (List<Versao>) dao.getByVersao(from);
        Versao v = null;
        if (vlist.isEmpty()) {
            return;
        }
        v = vlist.get(0);

        Versao newv = new Versao();
        newv.setId(v.getId());
        newv.setNome(nomeTo);
        newv.setVersao(to);
        newv.setTabelas(v.getTabelas());
        dao.copiarTudo(newv);
        dao.commit();
        dao.close();
    }
}
