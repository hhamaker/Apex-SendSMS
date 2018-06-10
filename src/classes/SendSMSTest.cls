@isTest
public class SendSMSTest {

    static testMethod void testSendSMS(){
        //send the messages to get the code coverage needed.
        SendSMS send = new SendSMS();
        send.sendText();
    }
}