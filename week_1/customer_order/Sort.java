public class Sort {
    public static void main(String[] args) {
        
        Order[] orders={
            new Order("001", "Anguraj", 1000.00),
            new Order("002", "Balaji", 850.50),
            new Order("003", "Cibhi", 900.50),
            new Order("004", "Dhanush", 750.00),
        };

        Algorithms.bubbleSort(orders);
        System.out.println("Bubble sorted : ");
        for(Order order:orders){
            System.out.println(order);
        }

        orders= new Order[]{
            new Order("001", "Anguraj", 1000.00),
            new Order("002", "Balaji", 850.50),
            new Order("003", "Cibhi", 900.50),
            new Order("004", "Dhanush", 750.00),
        };

        Algorithms.quickSort(orders, 0, orders.length-1);
        System.out.println("Quick sorted : ");
        for(Order order:orders){
            System.out.println(order);
        }

    }
}
