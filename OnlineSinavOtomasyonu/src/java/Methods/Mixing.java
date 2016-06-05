/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Methods;


import java.util.Random;

/**
 *
 * @author Nuri
 */
public class Mixing {
    public static int[] shuffle(int[] array) {

    Random ran = new Random();

    for(int i = 0; i < array.length * 2; ++i) {

      int fromIndex = ran.nextInt(array.length);

      int toIndex = ran.nextInt(array.length);

      int tmp = array[fromIndex];

      array[fromIndex] = array[toIndex];

      array[toIndex] = tmp;

    }
    return array;
    }
    
    public static void main(String[] args) {
        
        int a[]={1,2,3,4,5,6,7,8,9,10};
        int array[]=shuffle(a);
        for (int i = 0; i < array.length; i++) {
           
            System.out.println(array[i]+"");
        }
    }
    
    
}
