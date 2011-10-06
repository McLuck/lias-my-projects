/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.HB;
import com.compsis.sigf.dao.VersaoDAO;
import com.compsis.sigf.domain.Insert;
import com.compsis.sigf.domain.Versao;
import com.compsis.sigf.script.manager.ManagementScript;
import org.hibernate.classic.Session;

/**
 *
 * @author lamancio
 */
public class TesteHB3 {

    public static void main(String... arg) {
        VersaoDAO vdao = (VersaoDAO) AFactoryDao.getInstance(VersaoDAO.class);;
        Versao v = vdao.obter(1);
        
        for(Insert ii : v.getInserts()){
            if(ii!=null){
                System.out.println(ii.getDescricao());
            }
        }

        //System.out.println(ManagementScript.getInstance().export(v.getTabelas()));
        //vdao.close();
        //Para apagar
        //vdao.apagarTest1(v);
/*
        vdao.clear();

        vdao.setEvit(true);

        //v.setId(null);
        v.setVersao(36);
        v.setNome("New Head");
        vdao.copiarTudo(v);


        vdao.commit();
        vdao.close();*/
    }
}
