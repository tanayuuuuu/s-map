# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
    before_action :reject_user, only: [:create]

  # GET /resource/sign_in
   # def new
   # end

  # POST /resource/sign_in
   # def create
   #   super
   # end

  # DELETE /resource/sign_out
   # def destroy
   #   super
   # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   # def configure_sign_in_params
   #  devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
   # end
   def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
     if @user
      if (@user.valid_password?(params[:user][:password]) && (@user.is_deleted == true))
      redirect_to new_user_session_path
      end
     # else
     #  flash
     end
   end

    def after_sign_in_path_for(resource)
      user_path(current_user)
    end
end
