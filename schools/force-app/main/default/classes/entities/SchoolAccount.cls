public abstract class SchoolAccount {
    
    protected Id accountId {get; set;}
    protected Id schoolId {get; set;}
    protected String firstName {get; set;}
    protected String secondName {get; set;}
    protected String lastName {get; set;}
    protected String fullName {get; set;}
    protected Profile__c profile {get; set;}
    

    public SchoolAccount(String fullName, Id schoolId) {
        this.fullName = fullName;
        this.schoolId = schoolId;
        this.setNames(fullName);
    }

    public Boolean isFullNameValid(String fullName) {
        String fullNameRegex = '^(\\b[A-Z]{1}[a-z]+) ([A-Z]{1}[a-z]+\\b) ([A-Z]{1}[a-z]+\\b)$';
        Pattern pattern = Pattern.compile(fullNameRegex);
        Matcher matcher = pattern.matcher(fullName);

        return matcher.matches();
    }

    protected Profile__c createProfile() {
        this.profile = new Profile__c(Name = this.fullName);
        if (this instanceOf Teacher) {
            this.profile.Teacher_ID__c = this.accountId;
        } else if (this instanceOf Student) {
            this.profile.Student_ID__c = this.accountId;
        }

        Database.insert(this.profile);
        return this.profile;
    }

    protected abstract SObject save();

    private void setNames(String fullName) {
        if (isFullNameValid(fullName)) {
            throw new InvalidAccountNameException('Invalid Name! Please put the names in correct form. Example: "Vasil Ivanov Panovski"');
        }

        String[] names = fullName.split(' ');
        this.firstName = names[0];
        this.secondName = names[1];
        this.lastName = names[2];
    }
}
