import java.io.*; //указва, че ще използваме библиотека io 

class Ex_22 { //създаваме нов клас с име ex_22 
 int x=23; 
 int y=45; 

 void change_x_y () { //процедура за смяна на променливите 
 int buf = x; 
 x = y; 
 y = buf; // буферна променлива 
 } 

 public static void main(String[] args) {// главна прогр. 
	Ex_22 NewEx_22=new Ex_22(); 
	System.out.println("Въведена стойност за х " + NewEx_22.x + "стойност за y " + NewEx_22.y); 
	NewEx_22.change_x_y (); //използва подпрограма 
	System.out.println("След размяната х е " + NewEx_22.x + " а у е " + NewEx_22.y);
 } 
 
} 