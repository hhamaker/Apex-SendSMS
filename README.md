# SendSMS

The purpose of this project is to send text messages using Salesforce and sms gateways.

Steps to Install:
1. deploy this package via ant

2. Create a SMS_User for who you want to send the text too.
  (you will need to look up the carrier sms gateway domain online)
  Example: 
  - Name: 'your Name'
  - Phone_Number__c: 'your phone number'
  - Domain__c: '@msg.fi.google.com'
  
3.Change the message to whatever you want.

To run this, just instanciate the class and call the method in dev console or any other classes you want to send texts in!

SendSMS s = new SendSMS();
s.sendText();
