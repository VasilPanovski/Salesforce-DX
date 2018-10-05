public class Student extends SchoolAccount {

    private Id categoryId {get; set;}
    public List<Teacher> teachers {get; set;}
    
    public Student(String fullName, Id schoolId) {
        super(fullName, schoolId);
        this.teachers = new List<Teacher>();
    }

    public void addTeacher(Teacher teacher) {
        this.createJunction(this.accountId, teacher.accountId);
        this.teachers.add(teacher);
    }

    public void addCategory(Id categoryId) {
        this.categoryId = categoryId;
    }

    protected override sObject save() {
        Student__c student = StudentDao.save(super.fullName, super.schoolId, this.categoryId, super.profile);

        return student;
    } 

    private void createJunction(Id studentId, Id teacherId) {
        Teacher_Student__c junctionObj = new Teacher_Student__c(Student_ID__c = studentId, Teacher_ID__c = teacherId);

        Database.insert(junctionObj);
    }
}
