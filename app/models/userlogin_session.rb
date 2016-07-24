class UserloginSession < Authlogic::Session::Base
  logout_on_timeout true
  generalize_credentials_error_messages true
=begin
  validate :custom_errormsgs

  private
    def custom_errormsgs
      #RAILS_DEFAULT_LOGGER.debug "checking errors ..."
      clear = false
      errors.each do |attr,message|
        if ( (attr == 'login' and message == 'is not valid') or (attr == 'password' and message == 'is not valid') )
          clear = true
        end
      end
      if clear
        errors.clear
        errors.add_to_base("Invalid login/password")
      end
    end
=end
end

