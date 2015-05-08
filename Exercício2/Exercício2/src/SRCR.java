import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Scanner;
import se.sics.jasper.SPException;



/**
 *
 * @author Patrícia
 */
public class SRCR {
    
    private static  String path = "C:\\Users\\Patrícia\\Desktop\\LEI 3.2\\SRCR\\srcr\\Exercício2\\Exercicio2";
    
    private static Prolog p;
    
    public static void main(String [] args) throws SPException, Exception{
        p = new Prolog(path);
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        int op = 0;
        
        while(op!=13){
        
        new Menu();
        
            op = Integer.parseInt(br.readLine());
            
            switch(op){
                case 1:
                    
                    System.out.println("Insira id do automóvel:");
                    Scanner scan = new Scanner(System.in);
                    int id = scan.nextInt();
                    System.out.println("Construtor: " + p.construtor(id));
                    System.out.println("Marca: " + p.marca(id));
                    System.out.println("Modelo: " + p.modelo(id));
                    System.out.println("Matrícula: " + p.matricula(id));
                    System.out.println("Cor: " + p.cor(id));
                case 2:
                    System.out.println("Insira id do automóvel: ");
                    Scanner scan2 = new Scanner(System.in);
                    int id2 = scan2.nextInt();
                    System.out.println("Proprietários: ");
                    p.printArray(p.registosPropriedade(id2));  
                case 3:
                    System.out.println("Insira id do automóvel: ");
                    Scanner scan3 = new Scanner(System.in);
                    int id3 = scan3.nextInt();
                    System.out.println("Insira ano: ");
                    int id4 = scan3.nextInt();
                    System.out.println("Proprietários: ");
                    p.printArray(p.proprietariosDesde(id3,id4));  
                case 4:
                    System.out.println("Insira id do automóvel: ");
                    Scanner scan4 = new Scanner(System.in);
                    int id5 = scan4.nextInt();
                    System.out.println("Insira ano: ");
                    int id6 = scan4.nextInt();
                    System.out.println("Proprietários: ");
                    p.printArray(p.proprietarioAte(id5,id6));
                case 5:
                    System.out.println("Insira cor: ");
                    Scanner scan5 = new Scanner(System.in);
                    String cor = scan5.nextLine();
                    
                case 6:
                case 7:
                case 8:
                case 9:
                case 10:
                case 11:
                case 12:
            }
        }
    }
    
}
