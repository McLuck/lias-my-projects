package teste;

import com.compsis.sigf.dao.VersaoDAO;
import com.compsis.sigf.domain.Versao;
import com.compsis.sigf.script.manager.ManagementScript;
import java.io.*;
import java.net.URL;
import java.security.CodeSource;
import java.security.ProtectionDomain;
import java.util.StringTokenizer;

/**
 *
 * @author lamancio
 */
public class TesteScript {

    public static void main(String... arg) {

        //VersaoDAO vdao = (VersaoDAO) AFactoryDao.getInstance(VersaoDAO.class);;
        //Versao versao = vdao.obter(1);

        File f = new File("C:\\funcionalidadesacesso.txt");

        StringBuffer sb = new StringBuffer();
        try {
            FileInputStream fis = new FileInputStream(f);
            BufferedReader in = new BufferedReader(new InputStreamReader(fis, "ISO-8859-1"));

            String line;
            while ((line = in.readLine()) != null) {
                sb.append(line);
            }


            String[] vt = sb.toString().split("\\);") ;
            StringBuffer sb2 = new StringBuffer();
            
            for(String s : vt){
                String lline = "";
                boolean encontrado = false;
                for(int i=s.length()-1;i>=0;i--){
                    if(encontrado || s.charAt(i)=='\'' ){
                        encontrado = true;
                        lline = s.charAt(i)+lline;
                    }
                }
                
                String ax[] = lline.split("'");
                boolean aaa = true;
                for(String a : ax){
                    aaa = !aaa;
                    if(!aaa){
                        continue;
                    }
                    
                    sb2.append("UPDATE funcionalidadesacesso SET acesso = '");
                    sb2.append(a);
                    sb2.append("' WHERE acesso = '");
                    sb2.append(a.toLowerCase());
                    sb2.append("'; \n");
                }
                System.out.println(sb2.toString());
            }
            /*try {
                Thread.sleep(1000);
            } catch (Exception e) {
            }
            /*versao = ManagementScript.getInstance().importarFromSQL(sb.toString(), versao);
            vdao.salvar(versao);
            vdao.commit();
            vdao.close();
            System.out.println("");*/
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
