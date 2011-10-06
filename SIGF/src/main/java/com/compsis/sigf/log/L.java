/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.compsis.sigf.log;

/**
 *
 * @author Lucas Israel
 */
public class L {

    public static boolean DEBUG_MODE = true;
    public static boolean PRINT_STACK_TRACE = true;
    public static String STATUS_HTML = "";
    public static void d(String tag, Object o) {

        if (DEBUG_MODE) {
            System.out.print("[DEBUG] ");
            System.out.print(new java.util.Date());
            System.out.print(" - ");
            System.out.print(tag);
            System.out.print(" : ");
            if (o instanceof String) {
                System.out.println(String.valueOf(o));
                STATUS_HTML = "<span style='color:blue;'><i>".concat(String.valueOf(o)).concat("</i></span>");
            } else if (o instanceof Exception) {
                Exception ex = (Exception) o;
                System.err.println(ex.getMessage());
                STATUS_HTML = "<span style='color:red;'><i>".concat(String.valueOf(o)).concat("</i></span>");
                if (PRINT_STACK_TRACE) {
                    ex.printStackTrace();
                }
            } else {
                System.out.println(o);
                STATUS_HTML = "<span style='color:blue;'><i>".concat(String.valueOf(o)).concat("</i></span>");
            }
        }
    }
}
