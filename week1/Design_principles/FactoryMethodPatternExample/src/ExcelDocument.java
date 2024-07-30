public class ExcelDocument implements Document{
    
    @Override
    public void open(){
        System.out.println("Opening Excel document");
    }

    @Override
    public void save(){
        System.out.println("Save Excel document");
    }

    @Override
    public void close(){
        System.out.println("Close Excel document");
    }
    
}
