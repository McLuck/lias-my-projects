package teste;

import br.com.mcluck.asynchronously.Utils.Factory;
import br.com.mcluck.asynchronously.annotation.Asynchronous;

/**
 *
 * @author Lucas Israel
 */
public class ClasseTeste {
    public static void main(String...args) throws InstantiationException, IllegalAccessException{
        ClasseTeste teste = (ClasseTeste) Factory.getInstance(ClasseTeste.class);
        teste.metodo1();
        teste.metodo2();
        teste.metodo3();
        teste.metodo4();
        teste.metodo5();
        teste.metodo6();
    }
    public void metodo1(){
        System.out.println("Método1 executando");
    }
    @Asynchronous
    public void metodo2(){
        esperar();
        System.out.println("Método2 executando");
    }
    public void metodo3(){
        System.out.println("Método3 executando");
    }
    @Asynchronous
    public void metodo4(){
        esperar();
        System.out.println("Método4 executando");
    }
    public void metodo5(){
        System.out.println("Método5 executando");
    }
    public void metodo6(){
        System.out.println("Método6 executando");
    }
    
    
    
    
    
    
    
    
    private void esperar(){
        try{
            Thread.sleep(2000);
            System.out.println("Esperei dois segundos");
        }catch(Exception e){
            
        }
    }
    
}
