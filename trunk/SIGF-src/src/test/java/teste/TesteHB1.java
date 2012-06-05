/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.CampoDAO;
import com.compsis.sigf.dao.HB;
import com.compsis.sigf.dao.VersaoDAO;
import com.compsis.sigf.domain.*;

import java.util.ArrayList;

/**
 *
 * @author lamancio
 */
public class TesteHB1 {

    public static void main(String... args) {
        
        HB.getInstancia().getNewSession();
        long ini = new java.util.Date().getTime();
        Versao v = new Versao();
        VersaoDAO vdao = (VersaoDAO) AFactoryDao.getInstance(VersaoDAO.class);;
        v.setNome("HEAD");
        v.setVersao(30);
        v = (Versao)vdao.salvar(v);
        
        CampoDAO dao = (CampoDAO) AFactoryDao.getInstance(CampoDAO.class);
        for (int i = 0; i < 1000; i++) {
            Tabela tb = new Tabela();
            tb.setNome("Pessoa_" + i);
            tb.setVersao(v);
            for (int j = 0; j < 100; j++) {
                Campo c = new Campo();
                c.setNome("Nome" + i+" - Item: "+j);
                c.setValor("Lucas Israel - " + i+" - Item: "+j);
                c.setTabela(tb);

                c = (Campo)dao.salvar(c);
                tb = c.getTabela();
            }

        }
        dao.commit();
        dao.close();
        
        long fid = ((new java.util.Date().getTime()) - ini)/1000;
        
        System.out.println(((1000*100)+1000)+" registros salvos em "+fid + " segundo(s)");
    }
}
