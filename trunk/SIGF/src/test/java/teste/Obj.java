/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package teste;

/**
 *
 * @author lamancio
 */
public class Obj implements Comparable<Obj> {

    private int ordem;
    private String qq;

    /**
     * @return the ordem
     */
    public int getOrdem() {
        return ordem;
    }

    /**
     * @param ordem the ordem to set
     */
    public void setOrdem(int ordem) {
        this.ordem = ordem;
    }

    public int compareTo(Obj o) throws NullPointerException {
        if (o != null) {
            return (o.getOrdem() > ordem) ? -1 : o.getOrdem() == ordem ? 0 : 1;
        }
        throw new NullPointerException("");
    }

    /**
     * @return the qq
     */
    public String getQq() {
        return qq;
    }

    /**
     * @param qq the qq to set
     */
    public void setQq(String qq) {
        this.qq = qq;
    }
}
