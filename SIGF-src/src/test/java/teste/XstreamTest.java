/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.VersaoDAO;
import com.compsis.sigf.domain.Campo;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.domain.Versao;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/**
 *
 * @author lamancio
 */
public class XstreamTest {

    public static void main(String... a) throws FileNotFoundException, IOException {
        Versao v = getVersaoTeste();
        XStream xStream = new XStream(new DomDriver());
        xStream.alias("versao", Versao.class);
        xStream.alias("tabela", Tabela.class);
        xStream.alias("campo", Campo.class);
        xStream.setMode(XStream.ID_REFERENCES);
        File file = new File("c:\\modeloBD.xml");
        OutputStream out = new FileOutputStream(file);
        
        xStream.toXML(v, out);
        out.close();
        //System.out.println(xStream.toXML(v));
    }

    public static Versao getVersaoTeste() {
        VersaoDAO vdao = (VersaoDAO) AFactoryDao.getInstance(VersaoDAO.class);;
        Versao v = vdao.obter(1);
        List<Tabela> tlist = new ArrayList<Tabela>();
        for(Tabela t : v.getTabelas()){
            if(t==null)continue;
            List<Campo> clist = new ArrayList<Campo>();
            for(Campo c :t.getCampos()){
                if(c==null)continue;
                clist.add(c);
                //Forcar carregamento de tudo na memoria
            }
            t.setCampos(clist);
            tlist.add(t);
        }
        v.setTabelas(tlist);
        return v;
    }
}
