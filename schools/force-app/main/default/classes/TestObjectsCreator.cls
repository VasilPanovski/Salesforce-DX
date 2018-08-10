public with sharing class TestObjectsCreator {
    public TestObjectsCreator() {

    }

    public void createSchool(String name, String address, String type) {
        School__c school = new School__c(Name = name, Address__c = address, School_Type__c = type);
        insert school;
    }

    
}
