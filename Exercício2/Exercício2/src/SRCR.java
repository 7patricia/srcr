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
                case 11:
                    System.out.println("1. Inserir construtor");
                    System.out.println("2. Inserir marca");
                    System.out.println("3. Inserir modelo");
                    System.out.println("4. Inserir cor");
                    System.out.println("5. Inserir ano de fabrico");
                    System.out.println("6. Inserir estado");
                    System.out.println("7. Inserir matricula");
                    System.out.println("8. Inserir proprietario");
                    System.out.println("9. Voltar atrás");
                    
                    int op11 = 0;
                    while(op11!=9){
                        op11 = Integer.parseInt(br.readLine());
                        switch(op11){
                            case 1:
                                System.out.println("Insira id: ");
                                 Scanner scan20 = new Scanner(System.in);
                                 int id20 = Integer.parseInt(scan20.nextLine());
                                System.out.println("Insira construtor: ");
                                Scanner scan21 = new Scanner(System.in);
                                String constr = scan20.nextLine();
                                System.out.println(p.evolucaoConstrutor(id20,constr));
                                break;
                            case 2:
                                System.out.println("Insira id: ");
                                
                                System.out.println("Insira marca: ");
                                break;
                            case 3:
                                System.out.println("Insira id: ");
                                
                                System.out.println("Insira modelo: ");
                                break;
                            case 4:
                                System.out.println("Insira id: ");
                                
                                System.out.println("Insira cor: ");
                                break;
                            case 5:
                                System.out.println("Insira id: ");
                                
                                System.out.println("Insira ano de fabrico: ");
                                break;
                            case 6:
                                System.out.println("Insira id: ");
                                
                                System.out.println("Insira estado: ");
                                break;
                            case 7:
                                System.out.println("Insira id: ");
                                
                                System.out.println("Insira matricula: ");
                                break;
                            case 8:
                                System.out.println("Insira id: ");
                                
                                System.out.println("Insira modelo: ");
                                break;
                            
                        }
                        
                    }
                case 12:
                    System.out.println("1. Remover construtor");
                    System.out.println("2. Remover marca");
                    System.out.println("3. Remover modelo");
                    System.out.println("4. Remover cor");
                    System.out.println("5. Remover ano de fabrico");
                    System.out.println("6. Remover estado");
                    System.out.println("7. Remover matricula");
                    System.out.println("8. Remover proprietario");
                    System.out.println("9. Voltar atrás");
                    
                    int op12 = 0;
                    while(op12!=9){
                        op11 = Integer.parseInt(br.readLine());
                        switch(op11){
                            case 1:
                                System.out.println("Insira id: ");
                                
                                System.out.println("Insira construtor: ");
                                break;
                            case 2:
                                System.out.println("Insira id: ");
                                
                                System.out.println("Insira marca: ");
                                break;
                            case 3:
                                System.out.println("Insira id: ");
                                
                                System.out.println("Insira modelo: ");
                                break;
                            case 4:
                                System.out.println("Insira id: ");
                                
                                System.out.println("Insira cor: ");
                                break;
                            case 5:
                                System.out.println("Insira id: ");
                                
                                System.out.println("Insira ano de fabrico: ");
                                break;
                            case 6:
                                System.out.println("Insira id: ");
                                
                                System.out.println("Insira estado: ");
                                break;
                            case 7:
                                System.out.println("Insira id: ");
                                
                                System.out.println("Insira matricula: ");
                                break;
                            case 8:
                                System.out.println("Insira id: ");
                                
                                System.out.println("Insira modelo: ");
                                break;
                            
                        }
                        
                    }
            }
        }
    }
    
}
