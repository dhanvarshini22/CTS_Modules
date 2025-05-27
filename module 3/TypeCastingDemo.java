public class TypeCastingDemo {
    public static void main(String[] args) {
        double myDouble = 9.78;
        int myInt = (int) myDouble;
        System.out.println("Original double value: " + myDouble);
        System.out.println("Double casted to int: " + myInt);

        int anotherInt = 25;
        double anotherDouble = anotherInt;
        System.out.println("Original int value: " + anotherInt);
        System.out.println("Int casted to double: " + anotherDouble);
    }
}
