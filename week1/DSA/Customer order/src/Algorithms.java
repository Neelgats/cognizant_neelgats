public class Algorithms {

    //bubble sort
    public static void bubbleSort(Order[] orders){
        int n=orders.length;
        boolean swapped;
        for(int i=0;i<n-1;i++){
            swapped=false;
            for(int j=0;j<n-i-1;j++){
                if(orders[j].gettotalPrice()>orders[j+1].gettotalPrice()){
                    Order temp=orders[j];
                    orders[j]=orders[j+1];
                    orders[j+1]=temp;
                    swapped=true;
                }
            }
            if(!(swapped)){
                break;
            }
        }
    }

    //quick sort
    public static void quickSort(Order[] orders,int low,int high){
        if(low<high){
            int pi=partition(orders,low,high);

            quickSort(orders,low,pi-1);
            quickSort(orders,pi+1,high);
        }
    }

    private static int partition(Order[] orders,int low,int high){
        double pivot=orders[high].gettotalPrice();
        int i=(low-1);
        for(int j=low;j<high;j++){
            if(orders[j].gettotalPrice()<=pivot){
                i++;
                //swap orders[i+1] and orders[j]
                Order temp=orders[i];
                orders[i]=orders[j];
                orders[j]=temp;
            }
        }
        //swap orders[i+1] and orders[high]
        Order temp=orders[i+1];
        orders[i+1]=orders[high];
        orders[high]=temp;

        return i+1;

    }
}
