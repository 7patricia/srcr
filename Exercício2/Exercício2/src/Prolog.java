
import java.util.ArrayList;
import java.util.HashMap;
import se.sics.jasper.Query;
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
public class Prolog {
    SICStus sp;
    
    public Prolog(String path) throws SPException{
           sp = new SICStus(new String[0], null);
           sp.load(path);
    }
    
    public String construtor(int id) throws SPException, InterruptedException, Exception{
        String queryS = "demo(automovelC,"+id+",X).";
        String res="";
        
        HashMap map = new HashMap();
        Query query = sp.openPrologQuery(queryS,map);
        while(query.nextSolution()){
            res= map.toString();
        }
        query.close();
        return res;
    }
    
    public ArrayList<String> automoveisCons(String Cons) throws SPException, InterruptedException, Exception{
        String queryS = "automovelC(X,"+Cons+").";
        ArrayList<String> res=new ArrayList<String>();
        
        HashMap map = new HashMap();
        Query query = sp.openPrologQuery(queryS,map);
        while(query.nextSolution()){
            res.add(map.toString());
        }
        query.close();
        return res;
    }
    
    public String modelo(int id) throws SPException, InterruptedException, Exception{
        String queryS = "automovelm("+id+",X).";
        String res="";
        
        HashMap map = new HashMap();
        Query query = sp.openPrologQuery(queryS,map);
        while(query.nextSolution()){
            res=map.toString();
        }
        query.close();
        return res;
    }
    
    public ArrayList<String> automoveisMod(String Modelo) throws SPException, InterruptedException, Exception{
        String queryS = "automovelm(X,"+Modelo+").";
        ArrayList<String> res=new ArrayList<String>();
        
        HashMap map = new HashMap();
        Query query = sp.openPrologQuery(queryS,map);
        while(query.nextSolution()){
            res.add(map.toString());
        }
        query.close();
        return res;
    }
    
    public String marca(int id) throws SPException, InterruptedException, Exception{
        String queryS = "automovelM("+id+",X).";
        String res="";
        
        HashMap map = new HashMap();
        Query query = sp.openPrologQuery(queryS,map);
        while(query.nextSolution()){
            res=map.toString();
        }
        query.close();
        return res;
    }
    
    public ArrayList<String> automoveisMarca(String Marca) throws SPException, InterruptedException, Exception{
        String queryS = "automovelM(X,"+Marca+").";
        ArrayList<String> res=new ArrayList<String>();
        
        HashMap map = new HashMap();
        Query query = sp.openPrologQuery(queryS,map);
        while(query.nextSolution()){
            res.add(map.toString());
        }
        query.close();
        return res;
    }
    public String matricula(int id) throws SPException, InterruptedException, Exception{
        String queryS = "matricula("+id+",X).";
        String res = "";
        
        HashMap map = new HashMap();
        Query query = sp.openPrologQuery(queryS,map);
        while(query.nextSolution()){
            res=map.toString();
        }
        query.close();
        return res;
    }
    
    public String cor(int id) throws SPException, InterruptedException, Exception{
        String queryS = "cor("+id+",X).";
        String res="";
        
        HashMap map = new HashMap();
        Query query = sp.openPrologQuery(queryS,map);
        while(query.nextSolution()){
            res=map.toString();
        }
        query.close();
        return res;
    }
    
     public ArrayList<String> automoveisCor(String cor) throws SPException, InterruptedException, Exception{
        String queryS = "cor(X,"+cor+").";
        ArrayList<String> res=new ArrayList<String>();
        
        HashMap map = new HashMap();
        Query query = sp.openPrologQuery(queryS,map);
        while(query.nextSolution()){
            res.add(map.toString());
        }
        query.close();
        return res;
    }
    
    public String estado(int id) throws SPException, InterruptedException, Exception{
        String queryS = "estado("+id+",X).";
        String res="";
        
        HashMap map = new HashMap();
        Query query = sp.openPrologQuery(queryS,map);
        while(query.nextSolution()){
           res=map.toString();
        }
        query.close();
        return res;
    }
    
     public ArrayList<String> automoveisEstado(String Estado) throws SPException, InterruptedException, Exception{
        String queryS = "estado(X,"+Estado+").";
        ArrayList<String> res=new ArrayList<String>();
        
        HashMap map = new HashMap();
        Query query = sp.openPrologQuery(queryS,map);
        while(query.nextSolution()){
            res.add(map.toString());
        }
        query.close();
        return res;
    }
    public String anofabrico(int id) throws SPException, InterruptedException, Exception{
        String queryS = "anofabrico("+id+",X).";
        String res="";
        
        HashMap map = new HashMap();
        Query query = sp.openPrologQuery(queryS,map);
        while(query.nextSolution()){
            res=map.toString();
        }
        query.close();
        return res;
    }
    public ArrayList<String> automoveisAno(int Ano) throws SPException, InterruptedException, Exception{
        String queryS = "anofabrico(X,"+Ano+").";
        ArrayList<String> res=new ArrayList<String>();
        
        HashMap map = new HashMap();
        Query query = sp.openPrologQuery(queryS,map);
        while(query.nextSolution()){
            res.add(map.toString());
        }
        query.close();
        return res;
    }
    
    public ArrayList<String> registosPropriedade(int id) throws SPException, InterruptedException, Exception{
        String queryS = "proprietario("+id+",X,Y).";
        ArrayList<String> res=new ArrayList<String>();
        
        HashMap map = new HashMap();
        Query query = sp.openPrologQuery(queryS,map);
        while(query.nextSolution()){
            res.add(map.toString());
        }
        query.close();
        return res;
    }
    
    public ArrayList<String> proprietariosDesde(int id,int ano) throws SPException, InterruptedException, Exception{
        String queryS = "proprietarioDesde("+id+",X,"+ano+").";
        ArrayList<String> res=new ArrayList<String>();
        
        HashMap map = new HashMap();
        Query query = sp.openPrologQuery(queryS,map);
        while(query.nextSolution()){
            res.add(map.toString());
        }
        query.close();
        return res;
    }
    
   public ArrayList<String> proprietarioAte(int id,int ano) throws SPException, InterruptedException, Exception{
        String queryS = "proprietarioAte("+id+",X,"+ano+").";
        ArrayList<String> res=new ArrayList<String>();
        
        HashMap map = new HashMap();
        Query query = sp.openPrologQuery(queryS,map);
        while(query.nextSolution()){
            res.add(map.toString());
        }
        return res;
    }
   
   
   public void printArray(ArrayList<String> array){
       
       for(int i=0;i<array.size();i++){
           System.out.println(array.get(i));
       }
   }
   
   
}

