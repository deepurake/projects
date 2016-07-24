class UserMailerController < ApplicationController
   def create
	puts params
      email = params[:user_mailer]
	  recipient = email["recipient"]
	  subject = email["subject"]
	  message = email["message"]
	sender = email["sender"]
      UserMailer.deliver_company_mail(recipient, subject, message,sender)
      return if request.xhr?
      render :text => 'Message sent successfully'
   end
end

