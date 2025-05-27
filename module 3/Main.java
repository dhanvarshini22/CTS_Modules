class Car {
    String make;
    String model;
    int year;

    void displayDetails() {
        System.out.println("Make: " + make);
        System.out.println("Model: " + model);
        System.out.println("Year: " + year);
    }
}

public class Main {
    public static void main(String[] args) {
        Car car1 = new Car();
        car1.make = "Toyota";
        car1.model = "Corolla";
        car1.year = 2020;
        
        Car car2 = new Car();
        car2.make = "Honda";
        car2.model = "Civic";
        car2.year = 2018;

        car1.displayDetails();
        System.out.println();
        car2.displayDetails();
    }
}
