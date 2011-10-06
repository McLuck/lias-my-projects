package teste;

import com.compsis.sigf.script.manager.ManagementScript;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.VersaoDAO;
import com.compsis.sigf.domain.Campo;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.domain.Versao;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Lucas Israel
 */
public class ParseSqlToXML {

    public static void main(String... args) {
        File f = new File("C:\\scripts\\sgap.sql");

        StringBuffer sb = new StringBuffer();
        try {
            FileInputStream fis = new FileInputStream(f);
            BufferedReader in = new BufferedReader(new InputStreamReader(fis, "ISO-8859-1"));

            String line;
            while ((line = in.readLine()) != null) {
                sb.append(line);
            }
            
            System.out.println("Processando...");
            try {
                Thread.sleep(1000);
            } catch (Exception e) {
            }
            in.close();
            Versao v = ManagementScript.getInstance().importarFromSQL(sb.toString(), "Head", 30);
            List<Versao> lista = ManagementScript.getInstance().SPLIT_TABELAS(v);
            System.out.println("Aguarde...\nProcessando dados.");
            v.setTabelas(new ArrayList<Tabela>());
            for(Versao vs : lista){
                v.getTabelas().add(vs.getTabelas().get(0));
            }
            VersaoDAO vdao = (VersaoDAO) AFactoryDao.getInstance(VersaoDAO.class);;
            vdao.salvar(v);
            vdao.commit();
            vdao.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void writeXML(Versao v){
        try {
            String name = "";
            name = v.getTabelas().get(0).getNome()+v.getVersao()+".xml";
            XStream xStream = new XStream(new DomDriver());
            xStream.alias("versao", Versao.class);
            xStream.alias("tabela", Tabela.class);
            xStream.alias("campo", Campo.class);
            xStream.setMode(XStream.ID_REFERENCES);
            File file = new File("C:\\scripts\\"+name);
            OutputStream out = new FileOutputStream(file);
            xStream.toXML(v, out);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
