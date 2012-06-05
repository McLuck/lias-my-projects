/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import com.compsis.sigf.dao.HB;
import com.compsis.sigf.script.manager.ManagementScript;

/**
 *
 * @author lamancio
 */
public class TesteCopia {
    public static void main (String...args) throws IllegalAccessException, InstantiationException{
        HB.getInstancia().getNewSession();
        //ManagementScript.getInstance().gc();
        ManagementScript.getInstance().copyVersao(30, 31, "NewHead");
        System.out.println("A partir deste ponto, o tratamento sera assincrono.");
    }
}
