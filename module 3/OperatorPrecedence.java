import java.util.Scanner;

public class OperatorPrecedence {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Enter first number:");
        int num1 = scanner.nextInt();

        System.out.println("Enter second number:");
        int num2 = scanner.nextInt();

        System.out.println("Enter third number:");
        int num3 = scanner.nextInt();

        
        int result1 = num1 + num2 * num3;
        System.out.println("Result of " + num1 + " + " + num2 + " * " + num3 + " = " + result1);

        
        int result2 = (num1 + num2) * num3;
        System.out.println("Result of (" + num1 + " + " + num2 + ") * " + num3 + " = " + result2);

       
        if (num2 != 0) {
            int result3 = num1 / num2 + num3 * 2;
            System.out.println("Result of " + num1 + " / " + num2 + " + " + num3 + " * 2 = " + result3);
        } else {
            System.out.println("Cannot perform division by zero in expression 3.");
        }

       
        if ((num2 + num3) != 0) {
            int result4 = num1 / (num2 + num3) * 2;
            System.out.println("Result of " + num1 + " / (" + num2 + " + " + num3 + ") * 2 = " + result4);
        } else {
            System.out.println("Cannot perform division by zero in expression 4.");
        }

      
        int result5 = num1 + num2 - num3 * 2 / 2;
        System.out.println("Result of " + num1 + " + " + num2 + " - " + num3 + " * 2 / 2 = " + result5);

        scanner.close();
    }
}
