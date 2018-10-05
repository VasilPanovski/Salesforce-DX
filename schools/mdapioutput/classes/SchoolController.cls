public with sharing class SchoolController {

    @AuraEnabled
    public static List<School__c> getSchools() {
        List<School__c> allSchools = [
                                        SELECT ID, Name, Address__c, School_Type__c
                                        FROM School__c
                                     ];
        
        return allSchools;
    }
}
