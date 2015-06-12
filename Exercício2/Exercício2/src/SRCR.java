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
        
        while(op!=11){
        
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
                    System.out.println("Ano de Fabrico: " + p.anofabrico(id));
                    System.out.println("Estado: " + p.estado(id));
                    break;
                case 2:
                    System.out.println("Insira id do automóvel: ");
                    Scanner scan2 = new Scanner(System.in);
                    int id2 = scan2.nextInt();
                    System.out.println("Proprietários: ");
                    p.printArray(p.registosPropriedade(id2));  
                    break;
                case 3:
                    System.out.println("Insira id do automóvel: ");
                    Scanner scan3 = new Scanner(System.in);
                    int id3 = scan3.nextInt();
                    System.out.println("Insira ano: ");
                    int id4 = scan3.nextInt();
                    System.out.println("Proprietários: ");
                    p.printArray(p.proprietariosDesde(id3,id4)); 
                    break;
                case 4:
                    System.out.println("Insira id do automóvel: ");
                    Scanner scan4 = new Scanner(System.in);
                    int id5 = scan4.nextInt();
                    System.out.println("Insira ano: ");
                    int id6 = scan4.nextInt();
                    System.out.println("Proprietários: ");
                    p.printArray(p.proprietarioAte(id5,id6));
                    break;
                case 5:
                    System.out.println("Insira cor: ");
                    Scanner scan5 = new Scanner(System.in);
                    String cor = scan5.nextLine();
                    p.printArray(p.automoveisCor(cor));
                    break;
                case 6:
                    System.out.println("Insira estado: ");
                    Scanner scan6 = new Scanner(System.in);
                    String estado = scan6.nextLine();
                    p.printArray(p.automoveisEstado(estado));
                    break;
                case 7:
                    System.out.println("Insira marca: ");
                    Scanner scan7 = new Scanner(System.in);
                    String marca = scan7.nextLine();
                    p.printArray(p.automoveisMarca(marca));
                    break;
                case 8:
                    System.out.println("Insira modelo: ");
                    Scanner scan8 = new Scanner(System.in);
                    String modelo = scan8.nextLine();
                    p.printArray(p.automoveisMod(modelo));
                    break;
                case 9:
                    System.out.println("Insira construtor: ");
                    Scanner scan9 = new Scanner(System.in);
                    String construtor = scan9.nextLine();
                    p.printArray(p.automoveisCons(construtor));
                    break;
                case 10:
                    System.out.println("Insira ano: ");
                    Scanner scan10 = new Scanner(System.in);
                    int ano = scan10.nextInt();
                    p.printArray(p.automoveisAno(ano));
                    break;
               
                            
                        
                        
                    
            }
        }
    }
    
}
