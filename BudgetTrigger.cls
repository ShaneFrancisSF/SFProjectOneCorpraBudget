trigger BudgetTrigger on Budget__c (after update) {
    
Budget__c b = Trigger.new[0];
    
     Account__c a = [SELECT Id, Name, balance__c FROM Account__c WHERE Id =: b.Account__c];
    
    a.Balance__c = a.Balance__c - b.BudgetSpent__c;
    
    update a;

//fetch the associated Account Ids
   /* List<Id> accountIds = new List<Id>();
    for(Budget__c b: Trigger.new) {
        accountIds.add(b.Account__c);
        
       //update the Account balances
     List<Account__c> accs = [SELECT Id, balance__c FROM Account__c WHERE Id IN : accountIds];
        
        for (Budget__c bgs: Trigger.new) {
            for(Account__c a: accs) {
                if (b.Account__c == a.Id) {
                    a.Balance__c = a.Balance__c - b.BudgetSpent__c;
                }
            }
        }
    } */
    
    
}