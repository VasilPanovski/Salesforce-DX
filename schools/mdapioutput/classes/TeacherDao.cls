public class TeacherDao {
    
    public static Teacher__c save(String fullName, Id schoolId, String title, Profile__c profile) {
         Teacher__c teacher = new Teacher__c(Name = fullName, 
                                            School__c = schoolId, 
                                            Title__c = title);
        if (profile != null) {
            teacher.Profile_ID__c = profile.Id;
        }

        Database.insert(teacher);

        return teacher;
    }

    public static Teacher__c getById(ID teacherId) {
        Teacher__c teacher = [
                                SELECT ID, Name, Title__c, Profile_ID__c
                                  FROM Teacher__c
                                 WHERE Id = :teacherId
                              ORDER BY Name
                            ];
        
        return teacher;
    }

    // get all teachers in specific school. 
    // We can save the school Id we are in into the browser local storage
    public static findAll(ID schoolId) {
        List<Teacher__c> teachers = [SELECT ID, Name FROM Teacher__c WHERE School__c == schoolId];

        return teachers;
    }
}
