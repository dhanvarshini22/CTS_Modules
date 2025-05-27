import java.util.*;
import java.util.stream.Collectors;

public class StreamEven {
    public static void main(String[] args) {
        List<Integer> numbers = Arrays.asList(5, 12, 7, 20, 33, 40, 2);

        // Filter even numbers using Stream API
        List<Integer> evenNumbers = numbers.stream()
                .filter(n -> n % 2 == 0)
                .collect(Collectors.toList());

        // Display the even numbers
        System.out.println("Even numbers: " + evenNumbers);
    }
}
