package com.compsis.sigf.dao;

import com.compsis.sigf.domain.Campo;
import com.compsis.sigf.domain.Funcionalidade;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.utils.GenericsUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Lucas Israel
 */
public class TabelaDAO extends BaseDAO<Tabela> {

    private TabelaDAO() {
        super(Tabela.class);
    }
    
    private static TabelaDAO dao;
    public static TabelaDAO getInstance(){
        if(dao == null){
            dao = new TabelaDAO();
        }
        return dao;
    }

    @Override
    public Object salvar(Tabela t) {
        Tabela t2;
        Tabela t3 = new Tabela();
        t3.setNome(t.getNome());
        t3.setVersao(t.getVersao());
        t2 = (Tabela) super.salvar(t3);
        CampoDAO cdao = (CampoDAO) AFactoryDao.getInstance(CampoDAO.class);
        for (Campo cp : t.getCampos()) {
            if (cp == null) {
                continue;
            }
            cp.setTabela(t2);
            cdao.salvar(cp);
        }
        t2 = obter(t2.getId());
        return t2;
    }

    public Object salvarCopiar(Tabela t) {
        Tabela t2;
        Tabela t3 = new Tabela();
        t3.setNome(t.getNome());
        t3.setVersao(t.getVersao());
        setEvit(true);
        t2 = (Tabela) super.salvar(t3);

        CampoDAO cdao = (CampoDAO) AFactoryDao.getInstance(CampoDAO.class);
        for (Campo cp : t.getCampos()) {
            if (cp == null) {
                continue;
            }
            cp.setTabela(t2);
            cp.setId(0);
            cdao.salvar(cp);
        }
        cdao.commit();
        getSession().clear();
        getSession().flush();
        cdao.close();
        t2 = obter(t2.getId());
        return t2;
    }

    /**
     * {@inheritDoc}
     */
    public List<Tabela> getByNome(String nome) {
        Criteria criteria = this.createCriteria(Tabela.class);
        criteria.add(Restrictions.eq("nome", nome));
        return GenericsUtil.checkedList(criteria.list(), Tabela.class);
    }

    public List<Tabela> getByVersao(Integer versaoNumber) {
        Criteria criteria = this.createCriteria(Tabela.class);
        criteria.add(Restrictions.eq("versao.versao", versaoNumber));
        return GenericsUtil.checkedList(criteria.list(), Tabela.class);
    }

    public List<Tabela> getByVersaoAndNome(Integer vid, String nomeTabela) {
        Criteria criteria = this.createCriteria(Tabela.class);
        criteria.add(Restrictions.and(Restrictions.eq("versao.id", vid), Restrictions.eq("nome", nomeTabela)));
        return GenericsUtil.checkedList(criteria.list(), Tabela.class);
    }

    public Tabela ObterPorVersaoENome(Integer vid, String nomeTabela) {
        Criteria criteria = this.createCriteria(Tabela.class);
        criteria.add(Restrictions.and(Restrictions.eq("versao.id", vid), Restrictions.eq("nome", nomeTabela)));
        //criteria.setMaxResults(1);
        List<Tabela> lst = GenericsUtil.checkedList(criteria.list(), Tabela.class);
        if (lst != null && !lst.isEmpty()) {
            return lst.get(0);
        }
        return null;
    }

    public List<Tabela> getFuncionalidadesByVersaoAndNomeAndValorCampo(Integer vid, String nomeTabela, String valor) {
        String[] v = valor.split(",");
        Criteria criteria = this.createCriteria(Campo.class);
        criteria.add(Restrictions.and(Restrictions.eq("versao.id", vid), Restrictions.and(Restrictions.eq("nome", "funcionalidades"), Restrictions.in("valor", v))));
        List<Tabela> listaT = new ArrayList<Tabela>();
        for (Campo cp : GenericsUtil.checkedList(criteria.list(), Campo.class)) {
            listaT.add(cp.getTabela());
        }
        return listaT;
    }

    /**
     * Lista de Tabela<br>
     * Exemplo: nomeTabela=papelFuncionalidade, nomeCampo=idfuncionalidade, valor=1 <br>
     * O que retorna: Uma lista de tabelas de papelfuncionalidade '1'
     * @param vid versao do Modelo
     * @param nomeTabela 
     * @param nomeCampo
     * @param valor 
     */
    public List<Tabela> getTabelas(int vid, String nomeTabela, String nomeCampo, String valor) {
        Criteria criteria = this.createCriteria(Campo.class);
        criteria.createAlias("tabela", "tab");
        criteria.createAlias("tab.versao", "tbversao");
        criteria.add(
                Restrictions.and(
                Restrictions.eq("tbversao.id", vid),
                Restrictions.and(
                Restrictions.eq("tab.nome", nomeTabela),
                Restrictions.and(
                Restrictions.eq("nome", nomeCampo),
                Restrictions.eq("valor", valor)))));
        List<Tabela> listaT = new ArrayList<Tabela>();
        for (Campo cp : GenericsUtil.checkedList(criteria.list(), Campo.class)) {
            listaT.add(cp.getTabela());
        }
        return listaT;
    }

    public List<Tabela> getRelatorioParametroByRelatorio(Integer vid, String relatorioId) {
        Criteria criteria = this.createCriteria(Campo.class);
        criteria.add(Restrictions.and(Restrictions.eq("nome", "idrelatorio"), Restrictions.eq("valor", relatorioId)));
        List<Tabela> lista = new ArrayList<Tabela>();
        for (Campo cp : GenericsUtil.checkedList(criteria.list(), Campo.class)) {
            if (cp != null) {
                lista.add(cp.getTabela());
            }
        }
        //criteria.add(Restrictions.and(Restrictions.and(Restrictions.eq("versao.id", vid), Restrictions.eq("nome", "relatorioparametro")), Restrictions.eq("", "")));
        return lista;
    }

    public static String[] IntegerToString(Integer[] v) {
        String vt[] = new String[v.length];
        for (int i = 0; i < v.length; i++) {
            vt[i] = String.valueOf(v[i]);
        }
        return vt;
    }

    public static String IntegerVetToString(Integer[] v) {
        StringBuffer sb = new StringBuffer();
        for (int i : v) {
            sb.append(String.valueOf(i).concat(", "));
        }
        String aux = sb.toString();
        if (aux.trim().endsWith(",")) {
            aux = aux.trim().substring(0, aux.trim().length() - 1);
        }

        return aux;
    }

    private String getSelectFuncionalidadesPadroes(int vid) {
        return getSelect(vid, IntegerVetToString(Funcionalidade.FUNCIONALIDADES_OPCIONAIS));
    }
    
    private String getSelectFuncionalidades(int vid, String[] ids) {
        StringBuffer sb = new StringBuffer();
        for(String s : ids)sb.append(s.concat(", "));
        String aux = sb.toString();
        if (aux.trim().endsWith(",")) {
            aux = aux.trim().substring(0, aux.trim().length() - 1);
        }
        return getSelect(vid, aux);
    }

    private String getSelect(int vid, String ids){
        ids = ids.replace(" ", "").trim().replace(",,", ",");
        StringBuffer sb = new StringBuffer();
        sb.append("select t.id as id, t.nome, t.ordem as ordem, cqry.nomecampo, cqry.valor as valor from tcampo cFiltro, ttabela t, tcampo cqry where t.id = cFiltro.tabela_id and t.id = cqry.tabela_id and cFiltro.nomecampo = \"idfuncionalidade\" AND  cFiltro.valor not in (");
        sb.append(ids);
        sb.append(") AND t.versao_id = ");
        sb.append(vid);
        sb.append(";");
        System.out.println(sb.toString());
        return sb.toString();
    }

    public List<Tabela> getFuncionalidades(int vid, String ids){
        List lista = getSession().createSQLQuery(getSelect(vid, ids)).list();
        return tratarSelectFuncionalidades(lista);
    }

    public List<Tabela> getFuncionalidades(int vid, String[] ids){
        List lista = getSession().createSQLQuery(getSelectFuncionalidades(vid, ids)).list();
        return tratarSelectFuncionalidades(lista);
    }
    
    public List<Tabela> test4(int vid){
        List lista = getSession().createSQLQuery(getSelectFuncionalidadesPadroes(vid)).list();
        return tratarSelectFuncionalidades(lista);
    } 
    
    private List<Tabela> tratarSelectFuncionalidades(List lista){
        tabelas = new HashMap<Integer, Tabela>();
        for(Object o : lista){
            Object[] ob = (Object[])o;
            Integer id = (Integer)ob[0];
            Tabela t = tabelas.get(id);
            if(t==null){
                t = new Tabela();
                t.setNome(String.valueOf(ob[1]));
                if(t.getNome().trim().toLowerCase().equals("funcionalidade")){
                    continue;
                }
                t.setOrdem((Integer)ob[2]);
                t.setCampos(new ArrayList<Campo> ());
                t.setId(id);
                Campo c = new Campo();
                c.setNome(String.valueOf(ob[3]));
                c.setTabela(t);
                c.setValor(String.valueOf(ob[4]));
                t.getCampos().add(c);
                tabelas.put(id, t);
            }else{
                Campo c = new Campo();
                c.setNome(String.valueOf(ob[3]));
                c.setTabela(t);
                c.setValor(String.valueOf(ob[4]));
                t.getCampos().add(c);
            }
        }
        System.out.println("Mapa concluido... Iniciando carregamento da lista com objetos");
        List<Tabela> tbs = new ArrayList<Tabela>();
        Set<Integer> keys = tabelas.keySet();
        for(int key : keys){
            tbs.add(tabelas.get(key));
        }
        System.out.println("Lista de funcionalidades carregada");
        tabelas.clear();
        tabelas = null;
        System.gc();
        return tbs;
    }
    
    private Map<Integer, Tabela> tabelas = new HashMap<Integer, Tabela>();
}