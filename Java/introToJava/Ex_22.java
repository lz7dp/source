import java.io.*; //������, �� �� ���������� ���������� io 

class Ex_22 { //��������� ��� ���� � ��� ex_22 
 int x=23; 
 int y=45; 

 void change_x_y () { //��������� �� ����� �� ������������ 
 int buf = x; 
 x = y; 
 y = buf; // ������� ���������� 
 } 

 public static void main(String[] args) {// ������ �����. 
	Ex_22 NewEx_22=new Ex_22(); 
	System.out.println("�������� �������� �� � " + NewEx_22.x + "�������� �� y " + NewEx_22.y); 
	NewEx_22.change_x_y (); //�������� ����������� 
	System.out.println("���� ��������� � � " + NewEx_22.x + " � � � " + NewEx_22.y);
 } 
 
} 