import java.util.*;
import java.util.stream.Collectors;

public class RecordExample {
    public record Person(String name, int age) {}

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        List<Person> people = new ArrayList<>();

        System.out.print("How many persons do you want to enter? ");
        int n = scanner.nextInt();
        scanner.nextLine(); // consume newline

        for (int i = 0; i < n; i++) {
            System.out.print("Enter name of person " + (i + 1) + ": ");
            String name = scanner.nextLine();

            System.out.print("Enter age of person " + (i + 1) + ": ");
            int age = scanner.nextInt();
            scanner.nextLine(); // consume newline

            people.add(new Person(name, age));
        }

        System.out.println("\nAll persons:");
        people.forEach(System.out::println);

        List<Person> adults = people.stream()
                                   .filter(p -> p.age() >= 18)
                                   .collect(Collectors.toList());

        System.out.println("\nAdults:");
        adults.forEach(System.out::println);

        scanner.close();
    }
}
