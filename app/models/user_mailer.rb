require 'action_mailer'

class UserMailer < ActionMailer::Base
  
   def company_mail(recipient, subject, message, sender)
      @subject = subject
      @recipients = recipient
      @from = sender
      @sent_on = Time.now
	  @body["title"] = 'This is title'
  	  @body["email"] = 'sender@yourdomain.com'
   	  @body["message"] = message
      @headers = {}
   end
end
