/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import br.com.mcluck.asynchronously.annotation.Asynchronous;
import com.compsis.sigf.dao.VersaoDAO;
import com.compsis.sigf.domain.Versao;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author lamancio
 */
public class TesteHB4 {

    public static boolean a = true;

    public static void main(String... ar) throws InstantiationException, IllegalAccessException {
        TesteHB4 t = (TesteHB4)br.com.mcluck.asynchronously.Utils.Factory.getInstance(TesteHB4.class);
        t.test();
        String a2 = JOptionPane.showInputDialog("Digite algo para parar o servico.");
        a = false;
    }
    
    private TesteHB4(){}

    @Asynchronous
    public void test() {
        while (a) {
            System.out.println("Aguardando...");
            try {
                Thread.sleep(2000);
            } catch (InterruptedException ex) {
                Logger.getLogger(TesteHB4.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
