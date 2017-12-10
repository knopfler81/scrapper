class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
   params.require(:user).permit(:nickname, :email, :password, :password_confirmtaion, :current_password)
  end

  def account_update_params
    params.require(:user).permit(:nickname, :email,  :password, :password_confirmtaion, :current_password)
  end

end
