package teste;

import com.compsis.sigf.dao.AFactoryDao;
import com.compsis.sigf.dao.TabelaDAO;
import com.compsis.sigf.domain.Campo;
import com.compsis.sigf.domain.Tabela;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lucas Israel
 */
public class TesteHB6 {

    public static void main(String... a) {
               
        TabelaDAO tdao = (TabelaDAO) AFactoryDao.getInstance(TabelaDAO.class);
        List<Tabela> ALL = new ArrayList<Tabela>();
        
        //Funcionalidades que sempre vao existir (TOTAL MENOS AREA DE VENDAS)
        System.out.println("Carregando padroes");
        List<Tabela> test = tdao.test4(1);
        for(Tabela t : test){
            System.out.println(t.getNome());
            for(Campo cp : t.getCampos()){
                System.out.print(" - ");
                System.out.print(cp.getNome());
                System.out.print(" = ");
                System.out.println(cp.getValor());
            }
        }
        System.out.println(test.size());
        tdao.close();
        tdao.clear();
    }
}