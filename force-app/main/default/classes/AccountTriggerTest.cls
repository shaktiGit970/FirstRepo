@isTest(seeAllData=false)
public class AccountTriggerTest {

    @TestSetup
    static void testSetup(){
        List<Account> acc = new List<Account>();
        for(Integer i=0; i<200; i++){
            acc.add(new Account(Name = 'Test'+i, BillingState = 'CA'));
        }
        
        insert acc;
    }
    
    @isTest
    static void testTrigger(){
        Test.startTest();
        
        List<Account> queriedAcc = [Select Id, Name, BillingState, ShippingState From Account];
        
        for(Account acc : queriedAcc){
        	system.assertEquals(acc.BillingState, acc.ShippingState);    
        }
        
        Test.stopTest();
    }
}