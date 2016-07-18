class RegistrationsController < Devise::RegistrationsController

  def create
    # Create the user from params
    @user = User.new sign_up_params
    if @user.save
      # Deliver the signup email
      UserNotifierMailer.send_signup_email(@user).deliver
      redirect_to(new_user_session_path, :notice => 'User created')
    else
      render :action => 'new'
    end
  end
end
