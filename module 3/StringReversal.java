import java.util.Scanner;

public class StringReversal {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt the user for a string
        System.out.print("Enter a string: ");
        String input = scanner.nextLine();

        // Reverse the string using StringBuilder
        String reversed = new StringBuilder(input).reverse().toString();

        // Display the reversed string
        System.out.println("Reversed string: " + reversed);

        scanner.close();
    }
}
