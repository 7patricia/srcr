
import se.sics.jasper.SICStus;
import se.sics.jasper.SPException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Patrícia
 */
public class SRCR {
    
    static SICStus sp;
    
    public static void main(String [] args) throws SPException
	{
        
            sp = new SICStus();
            sp.load("C:\\Users\\Patrícia\\Desktop\\LEI 3.2\\SRCR\\srcr\\Exercício2\\Exercicio2");
            
        }
    
}
