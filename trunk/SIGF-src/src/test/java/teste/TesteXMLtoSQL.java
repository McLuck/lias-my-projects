/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;
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
/**
 *
 * @author lamancio
 */
public class TesteXMLtoSQL {
    public static void main(String...args){
        File f = new File("c:\\preferencias.xml");
        try{
            XStream xStream = new XStream(new DomDriver());
            xStream.alias("versao", Versao.class);
            xStream.alias("tabela", Tabela.class);
            xStream.alias("campo", Campo.class);
            xStream.setMode(XStream.ID_REFERENCES);
            Versao v = (Versao)xStream.fromXML(f);
            
            System.out.println("123");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
