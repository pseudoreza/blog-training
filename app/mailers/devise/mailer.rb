if defined?(ActionMailer)
  class Devise::Mailer < Devise.parent_mailer.constantize
    include Devise::Mailers::Helpers

    def confirmation_instructions(record, token, opts={})
      @token = token
      devise_mail(record, :confirmation_instructions, opts)
    end

    def reset_password_instructions(record, token, opts={})
      @token = token
      devise_mail(record, :reset_password_instructions, opts)
    end

    def unlock_instructions(record, token, opts={})
      @token = token
      devise_mail(record, :unlock_instructions, opts)
    end

    def password_change(record, opts={})
      devise_mail(record, :password_change, opts)
    end

    def send_signup_email(user)
      @user = user
      devise_mail( :to => @user.email,
      :subject => 'Thanks for signing up for our amazing app' )
    end

  end
end
