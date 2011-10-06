/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/**
 *
 * @author lamancio
 */
public class TesteStrings {
    public static void main(String[]ar){
        List<Obj> set = new ArrayList<Obj>();
        Obj o1 = new Obj();
        o1.setQq("asasda");
        o1.setOrdem(1);
        Obj o2 = new Obj();
        o2.setQq("asasdaa");
        o2.setOrdem(1);
        Obj o3 = new Obj();
        o3.setQq("asasda a");
        o3.setOrdem(3);
        Obj o4 = new Obj();
        o4.setQq("asasdaz");
        o4.setOrdem(5);
        
        set.add(o4);
        set.add(o2);
        set.add(o1);
        set.add(o3);
        Collections.sort(set);
        for(Obj o : set){
            System.out.println(o.getOrdem());
        }
    }
}
