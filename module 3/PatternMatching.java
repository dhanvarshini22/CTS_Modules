public class PatternMatching {

    public static void checkObjectType(Object obj) {
        switch (obj) {
            case Integer i -> System.out.println("It's an Integer with value: " + i);
            case String s -> System.out.println("It's a String: \"" + s + "\"");
            case Double d -> System.out.println("It's a Double with value: " + d);
            case null -> System.out.println("It's null");
            default -> System.out.println("Unknown type: " + obj.getClass().getSimpleName());
        }
    }

    public static void main(String[] args) {
        checkObjectType(42);
        checkObjectType("Hello");
        checkObjectType(3.14);
        checkObjectType(true);
        checkObjectType(null);
    }
}
