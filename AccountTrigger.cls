trigger AccountTrigger on Account__c (before update) {
    
    
    //Account__c a = [SELECT Id, Name, balance__c FROM Account__c];
    
    //if(Trigger.isBefore && Trigger.isUpdate) {
     //   AccountValidator.noNegativeAccountBalance(a);
    //}
}