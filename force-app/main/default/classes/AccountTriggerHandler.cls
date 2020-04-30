/*
Objective : This is the account trigger handler class
Created by : Shakti Singh
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