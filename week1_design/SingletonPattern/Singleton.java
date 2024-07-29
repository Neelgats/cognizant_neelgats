public class Singleton {
    public static void main(String[] args) {
        Logger log1=Logger.getInstance();
        Logger log2=Logger.getInstance();

        log1.log("The first log.");
        log2.log("The second log.");
    }
}
