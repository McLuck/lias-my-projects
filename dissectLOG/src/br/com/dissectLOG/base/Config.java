/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.dissectLOG.base;

import br.com.dissectLOG.dao.implementation.HB;
import javax.swing.JOptionPane;

/**
 *
 * @author McLuck
 */
public class Config {
    public static void ConfigHibernate(){
        String host = null, user = null, pwd = null;
        host = JOptionPane.showInputDialog("Digite o endere�o do HOST do banco de dados:");
        user = JOptionPane.showInputDialog("Digite o usu�rio do banco de dados:");
        pwd = JOptionPane.showInputDialog("Digite a senha do usu�rio do banco de dados:");

        if(pwd!=null && host!=null && user !=null
                &&!pwd.isEmpty() && !user.isEmpty() && !host.isEmpty()){
                HB.changeDefault = true;
                HB.HOST = host;
                HB.USERNAME = user;
                HB.PASSWORD = pwd;
                JOptionPane.showMessageDialog(null, "Configura��es efetuada com sucesso. Inicie o LOG para realizar a conex�o.");
        }else{
            JOptionPane.showMessageDialog(null, "Dados inv�lidos!");
            System.exit(1);
        }
    }
    public static class LOG {
        public static boolean PRINT_IN_CONSOLE = false;
        public static String TAG_CONSOLE = "[DISSECT LOG]";
    }
}
