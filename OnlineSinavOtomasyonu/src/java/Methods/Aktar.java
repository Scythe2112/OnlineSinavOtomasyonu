/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Methods;

import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nuri
 */
public class Aktar {
    
    public static String Degis(String Input){
    byte[] bytes = new byte[Input.length()];
    for (int i = 0; i < Input.length(); i++) bytes[i] = (byte) Input.charAt(i);
    String Output=null;
        try {
            Output = new String(bytes, "UTF-8");
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(Aktar.class.getName()).log(Level.SEVERE, null, ex);
        }
    return Output;
    }
    
    public static void main(String[] args) {
        
    }
    
}
