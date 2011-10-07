/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.BaseDAO;
import com.compsis.sigf.dao.TabelaDAO;
import com.compsis.sigf.dao.VersaoDAO;
import com.compsis.sigf.domain.Campo;
import com.compsis.sigf.domain.DomainObject;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.domain.Versao;

import java.util.ArrayList;
import java.util.TreeSet;

/**
 *
 * @author lamancio
 */
public class TesteHB2 {

    public static void main(String... ar) {
    	
        VersaoDAO vdao = (VersaoDAO) AFactoryDao.getInstance(VersaoDAO.class);;
        Versao v = new Versao();
        v.setNome("Teste Cascata");
        v.setVersao(30);
        v.setTabelas(new ArrayList<Tabela>());


        int qtdTabelas = 100;
        int qtdCampoPorTabela = 10;

        for (int i = 0; i < qtdTabelas; i++) {
            Tabela t = new Tabela();
            t.setVersao(v);
            t.setNome("Tabela_" + i);
            t.setCampos(new ArrayList<Campo>());

            for (int j = 0; j < qtdCampoPorTabela; j++) {
                Campo c = new Campo();
                c.setNome("Campo_" + i + "_" + j);
                c.setValor(i + " " + j);
                c.setTabela(t);
                t.getCampos().add(c);
            }
            v.getTabelas().add(t);
        }


        vdao.salvar(v);
        vdao.commit();
        vdao.close();
    }
}
