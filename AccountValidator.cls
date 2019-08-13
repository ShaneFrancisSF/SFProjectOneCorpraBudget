public class AccountValidator {
    //Account__c a = [SELECT Id, Name, balance__c FROM Account__c];
    public static void noNegativeAccountBalance(Account__c a) {
        
            if(a.balance__c < 0.00){
                a.addError('Not enough funds to complete this transaction : ' + a.Name);
            }
        
    }
}