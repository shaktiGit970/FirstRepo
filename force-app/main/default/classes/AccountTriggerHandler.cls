/*
Objective : This is the account trigger handler class
*/
public class AccountTriggerHandler {

    public static void CreateAccounts(List<Account> listOfAccount){
        
        for(Account acc : listOfAccount){
            if(String.isNotBlank(acc.BillingState)){
               acc.ShippingState = acc.BillingState; 
            }
        }
    }
}