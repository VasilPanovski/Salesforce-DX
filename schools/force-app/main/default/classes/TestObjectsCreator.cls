public with sharing class TestObjectsCreator {
    public TestObjectsCreator() {
        School__c school = createSchool('TestSchool', 'Some Test Address', 'High school');
        System.debug(school);
    }

    public School__c createSchool(String name, String address, String type) {
        School__c school = new School__c(Name = name, Address__c = address, School_Type__c = type);
        insert school;

        return school;
    }

    public Category__c createCategory(String name, ID schoolId, ID teacherId) {
        Category__c category = new Category__c(Name = name, School__c = schoolId, Teacher_ID__c = teacherId);
        insert category;

        return category;
    }

    public Discipline__c createDiscipline(String name, ID schoolId) {
        Discipline__c discipline = new Discipline__c(Name = name, School__c = schoolId);
        insert discipline;

        return discipline;
    }

    public Teacher__c createTeacher(String name, ID schoolId, ID disciplineId) {
        Teacher__c teacher = new Teacher__c(Name = name, School__c = schoolId, Discipline_ID__c = disciplineId);
        insert teacher;

        return teacher;
    }
}
