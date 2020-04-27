global class FirstEmailService implements Messaging.InboundEmailHandler {
    
     global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
         Messaging.InboundEmail inboundEmail = new Messaging.InboundEmail();
         
         String palinTextbody = email.plainTextBody;
         System.debug('body = '+palinTextbody);
         
         List<String> ccAddress = email.ccAddresses;
         System.debug('ccAddress = '+ccAddress);
         
         String fromAddress = email.fromAddress;
         System.debug('from Address = '+fromAddress);
         
         String fromName = email.fromName;
         System.debug('fromName = '+fromName);
         
         List<Messaging.InboundEmail.Header> header= new List<Messaging.InboundEmail.Header>();
         header = email.headers;
         System.debug('header = '+header);
         
         List<String> toAddress = email.toAddresses;
         System.debug('toAddress = '+toAddress);
         
        List<Messaging.InboundEmail.BinaryAttachment> binayAtt = email.binaryAttachments;
         System.debug('binary Atta = '+binayAtt);
         
         if(binayAtt != null){
             for(Messaging.InboundEmail.BinaryAttachment att : binayAtt){
                 string str = att.fileName;
                 system.debug('-----'+str);
                 blob body = att.body;
                 if(str.containsIgnoreCase('.pdf')){
                     Attachment attachment = new Attachment();
                     attachment.Body = body;
                     attachment.Name = String.valueOf(str);
                     attachment.ParentId = '0010o00002eWMjQAAW'; 
                     insert attachment;
                 }
                 else if(str.containsIgnoreCase('.csv')){
                     system.debug('in csv = '+att.body.toString());
                     String csvData = att.body.toString();
                     List<String> data = csvData.split(',');
                     system.debug('data = '+data);
                     Account acc = new Account();
                     acc.Name = data[0];
                     acc.phone = data[1];
                     acc.BillingCity = data[2];
                     acc.AccountNumber = data[3];
                     insert acc;
                 }
                 
                 //String body = att.body.toString(); for csv.
                 /*Blob blobBody = att.body;
                 System.debug('blobBody = '+blobBody);
                 
                 String csvBody = EncodingUtil.base64Encode(blobBody);
                 System.debug('csvBody='+csvBody);*/
                 
                 
                 /*String str = att.body.toString();
                 System.debug('str = '+str);*/
             }
         }
         
         List<Messaging.InboundEmail.TextAttachment> textAtt = email.textAttachments;
         System.debug('textAttachments  = '+textAtt);
         
         if(textAtt != null){
             for(Messaging.InboundEmail.TextAttachment att : textAtt){
                 String strbody = att.body;
                 system.debug('body = '+strbody);
             }
         }
         
         String subject = email.subject;
         System.debug('toAddress = '+subject);
         
         String messageId = email.messageId;
         System.debug('messageId = '+messageID);
         
         String inReplyTo = email.inReplyTo;
         System.debug('InReply = '+inReplyTo);
         
         List<String> reference = email.references;
         System.debug('reference = '+reference);
         
         result.success = true;
         return result;
    }
}