global class myHandler implements Messaging.InboundEmailHandler {
    
	  global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
          
		  Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
         //Messaging.InboundEmail inboundEmail = new Messaging.InboundEmail();
         
         String palinTextbody = email.plainTextBody;
         System.debug('body = '+palinTextbody);
          
          return result;
      }
}