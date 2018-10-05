public with sharing class TestObjectsCreator {
    public TestObjectsCreator() {

        

        System.debug(school);
        System.debug(disciplines);
    }

    public static School__c createSchool(String name, String address, String type) {
        School__c school = new School__c(Name = name, Address__c = address, School_Type__c = type);
        insert school;

        return school;
    }

    public static Category__c createCategory(String name, ID schoolId, ID teacherId) {
        Category__c category = new Category__c(Name = name, School__c = schoolId, Teacher_ID__c = teacherId);
        insert category;

        return category;
    }



    public static List<Student__c> createStudents(String name, ID schoolId, Integer studentsCount) {
        List<Student__c> students = new List<Student__c>();
        for (Integer i = 0; i < length; i++) {
           
        }
        Student__c student = new Student__c(Name = name, School__c = schoolId, Discipline_ID__c = disciplineId);
        insert teacher;

        return teacher;
    }

    public static List<Discipline__c> createDisciplines(ID schoolId, ID teacherId, List<Student__c> students) {
        Discipline__c math = getDiscipline('Math', schoolId, teacherId, students);
        Discipline__c history = getDiscipline('History', schoolId, teacherId, students);
        Discipline__c geography = getDiscipline('Geography', schoolId, teacherId, students);
        Discipline__c[] disciplines = new Discipline__c[] { math, history, geography };
        insert disciplines;

        insert disciplines;
    }

    public static Discipline__c getDiscipline(String name, ID schoolId) {
        Discipline__c discipline = new Discipline__c(Name = name, School__c = schoolId);

        return discipline;
    }

    public static Teacher__c getTeacher(String name, String title, ID schoolId, ID disciplineId) {
        Teacher__c teacher = new Teacher__c(Name = name,  Title__c = title,
                                            School__c = schoolId, Discipline_ID__c = disciplineId);
        insert teacher;

        return teacher;
    }

    public static Student__c getStudent(String name, ID schoolId) {
        Student__c student = new Student__c(Name = name, School__c = schoolId);

        return student;
    }
}