package com.compsis.sigf.regras.command.sql;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.RelatorioConcessionariaDAO;
import com.compsis.sigf.dao.RelatorioDAO;
import com.compsis.sigf.dao.TabelaDAO;
import com.compsis.sigf.domain.Campo;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Relatorio;
import com.compsis.sigf.domain.RelatorioConcessionaria;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.domain.relatorio.RelatorioView;
import com.compsis.sigf.log.L;
import com.compsis.sigf.regras.command.Command;
import com.compsis.sigf.regras.command.GeralConverte;
import com.compsis.sigf.regras.command.PropertyRetriever;
import com.compsis.sigf.script.manager.ManagementScript;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lucas Israel
 */
public class RelatorioCommand implements PropertyRetriever, Command {

    private List<RelatorioConcessionaria> rcLista;
    private Tabela relTabela, relParamTabela;
    private RelatorioDAO rdao = (RelatorioDAO) AFactoryDao.getInstance(RelatorioDAO.class);
    private TabelaDAO tdao =(TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);
    private RelatorioConcessionariaDAO rcdao = (RelatorioConcessionariaDAO) AFactoryDao.getInstance(RelatorioConcessionariaDAO.class);
    private Integer vid;
    private List<Tabela> lista = new ArrayList<Tabela>();

    public RelatorioCommand(int vid, int idConcessionaria) {
        this.vid = vid;
        relTabela = tdao.getByVersaoAndNome(vid, "relatorio").get(0);
        relTabela.getCampos();
        relParamTabela = tdao.ObterPorVersaoENome(vid, "relatorioparametro"); //getByVersaoAndNome(vid, "relatorioparametro").get(0);
        relParamTabela.getCampos();
        rcLista = rcdao.getByConcessionaria(idConcessionaria);
    }
    
    public RelatorioCommand(int vid, Concessionaria conc) {
        this.vid = vid;
        relTabela = tdao.ObterPorVersaoENome(vid, "relatorio"); //.getByVersaoAndNome(vid, "relatorio").get(0);
        relTabela.getCampos();
        relParamTabela = tdao.ObterPorVersaoENome(vid, "relatorioparametro"); //.getByVersaoAndNome(vid, "relatorioparametro").get(0);
        relParamTabela.getCampos();
        rcLista = conc.getRelatorios();
    } 

    @Override
    public void execute() {
        L.d(this.getClass().getName() , "Tratando relatório e suas dependencias...");
        
        for (RelatorioConcessionaria rc : rcLista) {
            if(rc==null)continue;
            Tabela tb = (Tabela) relTabela.replicate(null);
            //add o relatorio selecionado
            for (Campo cp : tb.getCampos()) {
                if (cp != null) {
                    if (cp.getNome().toLowerCase().trim().equals("idrelatorio")) {
                        cp.setValor(rc.getRelatorio().getIdrelatorio());
                    } else if (cp.getNome().toLowerCase().trim().equals("idgrupo")) {
                        cp.setValor(rc.getRelatorio().getIdGrupo());
                    } else if (cp.getNome().toLowerCase().trim().equals("idorigem")) {
                        cp.setValor(GeralConverte.IDS.GET_ID_CONCESSIONARIA(rc.getConcessionaria()));
                    } else if (cp.getNome().toLowerCase().trim().equals("titulo")) {
                        cp.setValor(rc.getRelatorio().getTitulo());
                    } else if (cp.getNome().toLowerCase().trim().equals("versao")) {
                        cp.setValor(rc.getRelatorio().getVersao());
                    } else if (cp.getNome().toLowerCase().trim().equals("arquivo")) {
                        cp.setValor(rc.getRelatorio().getArquivo());
                    } else if (cp.getNome().toLowerCase().trim().equals("listarelatorio")) {
                        cp.setValor(rc.getRelatorio().getListaRelatorio());
                    } else if (cp.getNome().toLowerCase().trim().equals("arquivoDetalhe")) {
                        cp.setValor(rc.getRelatorio().getArquivoDetalhe());
                    } else if (cp.getNome().toLowerCase().trim().equals("usebean")) {
                        cp.setValor(rc.getRelatorio().getUsebean());
                    }
                }
            }
            lista.add(tb);
            L.d(this.getClass().getName() , "Relatórios carregados, tratando dependencias de relatorios...");
            //Add todos os inserts de relatorioparametro par ao relatorio selecionado
            List<Tabela> listaRelParametros = tdao.getRelatorioParametroByRelatorio(vid, String.valueOf(rc.getRelatorio().getIdrelatorio()));
            lista.addAll(listaRelParametros);
            L.d(this.getClass().getName() , "Relatorios e dependencias carregados...");
        }
    }

    @Override
    public String getPropertyName() {
        return "";
    }

    @Override
    public Object getPropertyValue() {
        String ret = ManagementScript.getInstance().export(lista);
        //Tenta descartar lixo
        /*rdao.close();
        rdao.clear();
        rdao = null;
        rcdao.close();
        rcdao.clear();
        rcdao = null;
        tdao.close();
        tdao.clear();
        tdao = null;
        lista = null;
        System.gc();*/
        return ret;
    }
}
