trigger BudgetTrigger on Budget__c (after update, after Delete) {
    //fetch the associated Account Ids
   if (Trigger.isAfter && Trigger.isUpdate){
         	Budget__c b = Trigger.old[0];
            Account__c a = [SELECT Id, Name, balance__c FROM Account__c WHERE Id =: b.Account__c];
    		BudgetAccountCalculator.addBudgetSpentToAccountBalance(b, a);
            update a;
     } else if(Trigger.isAfter && Trigger.isDelete) {
          Budget__c d = Trigger.old[0];
          Account__c a = [SELECT Id, Name, balance__c FROM Account__c WHERE Id =: d.Account__c];  
          BudgetAccountCalculator.restoreFundsToAccountBalance(d, a);
          update a;
      }
   

 }