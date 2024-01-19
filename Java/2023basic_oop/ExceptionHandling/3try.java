import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        int choice = scanner.nextInt();

        String[] categories = {"PCs", "Notebooks", "Tablets", "Phones", "Аccessories"};

        try {
            if (choice >= 0 && choice < categories.length) {
                // Print the category at the specified index
                System.out.println(categories[choice]);
            } else {
                // Index is out of range
                System.out.println("Wrong Option");
            }
        } catch (ArrayIndexOutOfBoundsException e) {
            // Handle the exception if it occurs (though not necessary in this case)
            System.out.println("Exception: " + e.getMessage());
        }
    }
}
