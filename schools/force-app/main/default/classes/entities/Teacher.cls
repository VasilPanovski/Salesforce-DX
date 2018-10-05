public class Teacher extends SchoolAccount {

    private String title {get; set;}

    public Teacher(String fullName, Id schoolId, String title) {
        super(fullName, schoolId);
        this.title = title;
    }

    protected override sObject save() {
        Teacher__c teacher = TeacherDao.save(super.fullName, super.schoolId, this.title, super.profile);

        return teacher;
    } 
}
