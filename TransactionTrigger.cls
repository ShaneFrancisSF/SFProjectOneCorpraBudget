trigger TransactionTrigger on Transaction__c (after insert) {

	Transaction__c t = Trigger.new[0];
    
     Budget__c b = [SELECT Id, Name, BudgetSpent__c FROM Budget__c WHERE Id =: t.Budget__c];
    
    b.BudgetSpent__c = b.BudgetSpent__c + t.Amount__c;
    
    update b;

   /*List<Id> budgetIds = new List<Id>();
   for (Transaction__c trns: Trigger.new) {
   	budgetIds.add(trns.Budget__c);
   }
   
   List<Budget__c> bgs = [SELECT Id, Name, BudgetSpent__c FROM Budget__c WHERE ID IN : budgetIds];
   
    
  for (Transaction__c trns : Trigger.new) {
      for(Budget__C b : bgs) {
         if (trns.Budget__c == b.Id) {
             b.BudgetSpent__c = b.BudgetSpent__c + trns.Amount__c;
         }
      }
  } */
    
}