// ContactUsController.cls

public with sharing class ContactUsController {
    @AuraEnabled
    public static string createContactUsRecord(String name, String email, String phone, String reason, String description) {
        Contact contactUsRecord = new Contact();
        contactUsRecord.LastName = name;
        contactUsRecord.Email = email;
        contactUsRecord.Phone = phone;
        contactUsRecord.Reason__c = reason;
        contactUsRecord.Description = description;
        
        
        insert contactUsRecord;
        return 'True';
    }
}
