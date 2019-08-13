trigger TransactionTrigger on Transaction__c (after insert, after update, after delete) {
    
    if(Trigger.isAfter && Trigger.isInsert){
        Transaction__c t = Trigger.new[0];
        Budget__c b = [SELECT Id, Name, BudgetSpent__c FROM Budget__c WHERE Id =: t.Budget__c];
        BudgetAccountCalculator.addTransactionToBudgetSpent(b, t);
        update b;
    } else if (Trigger.isAfter && Trigger.isUpdate){
        Transaction__c u = Trigger.old[0];
        Budget__c b = [SELECT Id, Name, BudgetSpent__c FROM Budget__c WHERE Id =: u.Budget__c];
        BudgetAccountCalculator.updateTransactionInBudgetSpent(b, u);
        update b;
    } else if (Trigger.isAfter && Trigger.isDelete) {
        Transaction__c d = Trigger.old[0];
        Budget__c b = [SELECT Id, Name, BudgetSpent__c FROM Budget__c WHERE Id =: d.Budget__c];
        BudgetAccountCalculator.deleteTransactionFromBudgetSpent(b, d);
        update b;
    }
        
}