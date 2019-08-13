public class BudgetAccountCalculator {
    //For Transaction --> Account
    public static void addTransactionToBudgetSpent(Budget__c b, Transaction__c t){
        b.BudgetSpent__c = b.BudgetSpent__c + t.Amount__c;
    }
    
    // Update function is weird 
    //(Ex: Previous T-value $10,I change T-value to $100, BudgetSpent gets $100 added to it)
    //Does the reverse when the values are switched. Will Try to fix (Worked properly at some point)
    public static void updateTransactionInBudgetSpent(Budget__c b, Transaction__c u){
        b.BudgetSpent__c = b.BudgetSpent__c + u.Amount__c;
    }
    
    public static void deleteTransactionFromBudgetSpent(Budget__c b, Transaction__c d){
        b.BudgetSpent__c = b.BudgetSpent__c - d.Amount__c;
    }
    
    //For Budget --> Account
    public static void addBudgetSpentToAccountBalance(Budget__c b, Account__c a) {
        a.Balance__c = a.Balance__c - b.BudgetSpent__c;
    }
    
    public static void restoreFundsToAccountBalance(Budget__c d, Account__c a) {
        a.Balance__c = a.Balance__c + d.BudgetSpent__c;
    }
}