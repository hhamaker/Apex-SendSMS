public class SendSMS {
    
    public void sendText(){
        //declare your variables
        List<Messaging.SingleEmailMessage> singleEmailList = new List<Messaging.SingleEmailMessage>();
        List<SMS_User__mdt> smsUserList = new List<SMS_User__mdt>();        
        List<String> emailRecipientList = new List<String>();
        String subject = '';
        String body = '';
        
        //query the info you need from the custom metadata type
        smsUserList = [SELECT Id, MasterLabel , Domain__c, Phone_Number__c FROM SMS_User__mdt];        
        
        //set the userList
        if (!smsUserList.isEmpty()){
            for(SMS_User__mdt smsUser : smsUserList){
                String textEmail = smsUser.Phone_Number__c + smsUser.Domain__c;
                emailRecipientList.add(textEmail);
            }
        }
        
        if (!emailRecipientList.isEmpty()){
            //create and send the email
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    
            subject = 'Sending a test via APEX';
            body = 'Guess who just sent a text from SFDC without any 3rd party integrations?';
            
            //create the send to address
            mail.setToaddresses(emailRecipientList);
            mail.setReplyTo('test@testEmail.com');
            mail.setHtmlBody(body);
            mail.setSubject(subject);
            
            singleEmailList.add(mail);
            if (!Test.isRunningTest()){
                Messaging.SendEmailResult[] results = Messaging.sendEmail(singleEmailList);
            }
        }
    }
}