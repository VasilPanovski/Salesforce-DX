public class StudentDao {

   public static Student__c save(String fullName, Id schoolId, Id categoryId, Profile__c profile) {
         Student__c student = new Student__c(Name = fullName, 
                                            School__c = schoolId, 
                                            Category_ID__c = categoryId);
        if (profile != null) {
            student.Profile_ID__c = profile.Id;
        }

        Database.insert(student);

        return student;
    }

    // get all students in specific school. 
    // We can save the school Id we are in into the browser local storage
    public static findAll(ID schoolId) {
        List<Student__c>  students = [SELECT ID, Name FROM Student__c WHERE School__c == schoolId];

        return students;
    }
}
