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
public class TesteScript2 {
    public static void main(String...ar){
        HB.getInstancia().getNewSession();
        //ManagementScript.getInstance().gc();
        String resp = ManagementScript.getInstance().exportar(30);
        ManagementScript.getInstance().Salvar("C:\\script.sql", resp);
        System.out.println(resp);
    }
}

