import java.io.*; 
class First { 
 public static void main(String[] args) { 
 float MainPay=240, CPay=0; 
 System.out.println("Bruto Sallary: "+MainPay); 
 CPay = MainPay + MainPay*21/100; 
 CPay = CPay - CPay*20/100; 
 System.out.println ("Neto Sallary: " + CPay); 
 } 
} 