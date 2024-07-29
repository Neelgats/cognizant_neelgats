
import java.util.Arrays;
import java.util.Comparator;


public class Algorithms {

    // linera search

    public static Product linearSearch(Product[] products, String targetProductId) {
        for (Product product : products) {
            if (product.getProductId().equals(targetProductId)) {
                return product;
            }
        }
        return null;
    }

    // binary search

    public static Product binarySearch(Product[] products, String targetProductId) {
        Arrays.sort(products,Comparator.comparing(Product::getProductId));
        int left = 0;
        int right = products.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;
            int compare = products[mid].getProductId().compareTo(targetProductId);

            if (compare == 0) {
                return products[mid];
            } else if (compare < 0) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return null;
    }
}
