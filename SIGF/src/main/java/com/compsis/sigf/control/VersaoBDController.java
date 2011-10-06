package com.compsis.sigf.control;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.CampoDAO;
import com.compsis.sigf.dao.InsertDAO;
import com.compsis.sigf.dao.TabelaDAO;
import com.compsis.sigf.dao.VersaoDAO;
import com.compsis.sigf.domain.Campo;
import com.compsis.sigf.domain.ComboBox;
import com.compsis.sigf.domain.Insert;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.domain.Versao;
import com.compsis.sigf.script.manager.ManagementScript;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/**
 *
 * @author Lucas Israel
 */
public class VersaoBDController extends SimpleFormController {

    private Versao v;
    private List<Versao> listaV;
    private List<Tabela> listaT;
    private VersaoDAO vdao = (VersaoDAO) AFactoryDao.getInstance(VersaoDAO.class);;
    private Tabela t;
    private Insert insert;
    private InsertDAO idao = (InsertDAO) AFactoryDao.getInstance(InsertDAO.class);
    private List<Insert> listaI;

    public VersaoBDController() {
        super.setCommandClass(Insert.class);
        super.setCommandName("isr");
    }

    @Override
    protected ModelAndView onSubmit(Object command) throws Exception {
        Insert i = (Insert)command;
        System.out.println(i.getDescricao());
        ModelAndView mav = new ModelAndView("frames/success");
        return mav;
    }
    
    private Tabela getFromMap(Tabela t, Map<Tabela, List<Campo>> mapa){
        Set<Tabela> lista = mapa.keySet();
        for(Tabela tbl : lista){
            if(tbl.equals(t))
                return tbl;
        }
        
        return null;
    }

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String cmd = request.getParameter("cmd");
        if (cmd != null) {
            if(cmd.equals("getTableVersao")){
                String vid = request.getParameter("vid");
                listaV = vdao.obterTodos();
                ModelAndView mav = new ModelAndView("frames/listaVersao");
                mav.addObject("lista", listaV);
                return mav;
            }else if (cmd.equals("clonarVersao")) {
                String vid = request.getParameter("vid");
                
                v = vdao.obter(Integer.parseInt(vid));
                v.setNome(request.getParameter("nome"));
                v.setVersao(Integer.parseInt(request.getParameter("versao")));
                
                v = (Versao) vdao.copiarTudo(v);
                vdao.commit();
                vdao.close();
                ModelAndView mav = new ModelAndView("frames/success");
                mav.addObject("v", v);
                return mav;
            } else if (cmd.equals("alteracao")) {
                String sqlinsert = request.getParameter("sqlinsert");
                String vid = request.getParameter("vid");
                v = vdao.obter(Integer.parseInt(vid));
                Versao v2 = ManagementScript.getInstance().importarFromSQL(sqlinsert, "", 30);
                
                vdao.mesclarTabelasCampos(v, v2.getTabelas());
                vdao.clear();
                vdao.close();
                
                ModelAndView mav = new ModelAndView("frames/success");
                return mav;
            } else if (cmd.equals("insert")) {
                String vid = request.getParameter("vid");
                String tabela = request.getParameter("tabela");
                String desc = request.getParameter("descricao");
                v = vdao.obter(Integer.parseInt(vid));
                insert = new Insert();
                insert.setVersao(v);
                insert.setTabela(tabela);
                insert.setDescricao(desc);
                idao.salvar(insert);
                idao.commit();
                idao.close();
                ModelAndView mav = new ModelAndView("frames/success");
                mav.addObject("v", v);
                return mav;
            } else if (cmd.equals("optionsTable")) {
                String vid = request.getParameter("vid");
                v = vdao.obter(Integer.parseInt(vid));
                listaT = new ArrayList<Tabela>();
                List<ComboBox> opts = new ArrayList<ComboBox>();
                for (Tabela tb : v.getTabelas()) {
                    if (tb != null) {
                        ComboBox cb = new ComboBox();
                        cb.setValue(tb.getNome());
                        cb.setLabel(tb.getNome());
                        opts.add(cb);
                    }
                }
                ModelAndView mav = new ModelAndView("frames/optionList");
                mav.addObject("options", opts);
                return mav;
            }
        }

        return super.handleRequest(request, response);
    }

    protected Map referenceData(HttpServletRequest request) throws Exception {
        Map<Object, Object> dataMap = new HashMap<Object, Object>();

        String cmd = request.getParameter("cmd");
        listaV = vdao.obterTodos();
        dataMap.put("lista", listaV);
        if (cmd == null) {
            //listaV = vdao.obterTodos();
            //dataMap.put("lista", listaV);
        } else if (cmd.equals("getTable")) {
            String vid = request.getParameter("vid");
            String tnome = request.getParameter("tnome");
            v = vdao.obter(Integer.parseInt(vid));
            for (Tabela tb : v.getTabelas()) {
                if (tb != null) {
                    if (tb.getNome().trim().equals(tnome.trim())) {
                        t = tb;
                        dataMap.put("tabela", t);
                        break;
                    }
                }
            }
        } else if (cmd.equals("getTables")) {
            String vid = request.getParameter("vid");
            v = vdao.obter(Integer.parseInt(vid));
            listaT = new ArrayList<Tabela>();
            for (Tabela tb : v.getTabelas()) {
                if (tb != null) {
                    listaT.add(tb);
                }
            }
            dataMap.put("tabelas", listaT);
        } else if (cmd.equals("getInsert")) {
            String iid = request.getParameter("iid");
            insert = idao.obter(Integer.parseInt(iid));
            dataMap.put("insert", insert);
        } else if (cmd.equals("getInserts")) {
            String vid = request.getParameter("vid");
            v = vdao.obter(Integer.parseInt(vid));
            listaI = new ArrayList<Insert>();
            for (Insert ii : v.getInserts()) {
                if (ii != null) {
                    listaI.add(ii);
                }
            }
            dataMap.put("inserts", listaI);
        }

        return dataMap;
    }

    protected Object formBackingObject(HttpServletRequest request) throws Exception {
        String vid = request.getParameter("vid");
        if (vid != null && !vid.equals("") && !vid.equals("undefined")) {
            v = vdao.obter(Integer.parseInt(vid));
            return v;
        }

        return new Versao();
    }
}
