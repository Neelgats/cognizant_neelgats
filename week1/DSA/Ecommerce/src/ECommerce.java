
import java.util.Arrays;
import java.util.Comparator;
import java.util.Scanner;

public class ECommerce {
    public static void main(String[] args) {

        Product[] products = {
                new Product("001", "laptop", "electronics"),
                new Product("002", "mobile", "electronics"),
                new Product("003", "book", "book"),
                new Product("004", "pen", "stationary"),
                new Product("005", "watch", "electronics"),
        };

        // linear search
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the ProductId (ex: 001,002...): ");
        String target = sc.nextLine();
        Product linear = Algorithms.linearSearch(products, target);
        System.out.println("Linear search Result: " + linear);

        // binary search
        Arrays.sort(products, Comparator.comparing(Product::getProductId));

        Product binary = Algorithms.binarySearch(products, target);
        System.out.println("Binary search result: " + binary);
    }
}
