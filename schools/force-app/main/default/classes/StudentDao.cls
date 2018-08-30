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
}
