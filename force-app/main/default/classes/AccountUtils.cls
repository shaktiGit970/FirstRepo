public class AccountUtils {

    public static List<Account> accountsByState(String state){
        return [Select Id, Name From Account Where billingState =: state];
    }
}