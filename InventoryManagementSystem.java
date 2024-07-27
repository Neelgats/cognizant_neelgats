
import java.util.HashMap;

public class InventoryManagementSystem {

    private HashMap<String, Product> inventory;

    public InventoryManagementSystem() {
        this.inventory = new HashMap<>();
    }

    public void addProduct(Product product) {
        if (inventory.containsKey(product.getProductId())) {
            System.out.println("Product ID already exists.");
        } else {
            inventory.put(product.getProductId(), product);
            System.out.println("Product added: " + product);
        }
    }

    public void updateProduct(Product product) {
        if (inventory.containsKey(product.getProductId())) {
            inventory.put(product.getProductId(), product);
            System.out.println("The product with ID " + product.getProductId() + " was updated \n" + product);

        } else {
            System.out.println("Product ID does not exist");
        }
    }

    public void deleteProduct(String productId) {
        if (inventory.containsKey(productId)) {
            Product removedProduct = inventory.remove(productId);
            System.out.println("The product with id " + productId + " was deleted");
        } else {
            System.out.println("no product exists on the given productId");
        }
    }

    public Product geProduct(String productId) {
        return inventory.get(productId);
    }

    public static void main(String[] args) {
        InventoryManagementSystem ims = new InventoryManagementSystem();

        //defining the products
        Product p1 = new Product("001", "mobile", 50, 4999.99);
        Product p2 = new Product("002", "watch", 30, 1999.99);

        //adding the products
        ims.addProduct(p1);
        ims.addProduct(p2);

        //printing the product
        System.out.println("Retrieving product: " + ims.geProduct("001"));

        //delete a product
        ims.deleteProduct("002");

        //update the product
        Product up1 = new Product("001", "laptop", 60, 59999.99);
        ims.updateProduct(up1);

        //printing the product
        System.out.println("Retrieving product: " + ims.geProduct("001"));
        System.out.println(p1);

    }
}
