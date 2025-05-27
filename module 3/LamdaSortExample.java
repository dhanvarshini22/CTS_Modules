import java.util.*;

public class LamdaSortExample {
    public static void main(String[] args) {
        List<String> names = new ArrayList<>();
        names.add("John");
        names.add("Alice");
        names.add("Bob");
        names.add("Diana");

        // Sort using lambda expression
        Collections.sort(names, (s1, s2) -> s1.compareTo(s2));

        // Display sorted list
        for (String name : names) {
            System.out.println(name);
        }
    }
}
