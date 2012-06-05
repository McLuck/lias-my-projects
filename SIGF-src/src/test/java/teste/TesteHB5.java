/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.ConcessionariaDAO;
import com.compsis.sigf.dao.TabelaDAO;
import com.compsis.sigf.domain.Campo;
import com.compsis.sigf.domain.Concessionaria;
import com.compsis.sigf.domain.Tabela;
import com.compsis.sigf.domain.TipoPista;
import com.compsis.sigf.domain.TipoTransacao;

import java.util.List;

/**
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 *
 * @author lamancio
 */
public class TesteHB5 {
    public static void main(String...args){
        TabelaDAO tdao = (TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);
        List<Tabela> lista= tdao.getRelatorioParametroByRelatorio(1, "1001");
        System.out.println(lista.size());
        for(Tabela t : lista){
            System.out.print("INSERT INTO ");
            System.out.print(t.getNome());
            System.out.print(" (");
            boolean a = true;
            for(Campo cp : t.getCampos()){
                if(cp!=null){
                    if(a){
                        a = false;
                    }else{
                        System.out.print(", ");
                    }
                    System.out.print(cp.getNome());
                }
            }
            a = true;
            System.out.print(") VALUES (");
            for(Campo cp : t.getCampos()){
                if(cp!=null){
                    if(a){
                        a = false;
                    }else{
                        System.out.print(", ");
                    }
                    System.out.print(cp.getValor());
                }
            }
            System.out.println(");");
        }
        tdao.close();
    }
}
