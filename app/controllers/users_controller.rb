class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def quit

  end

  def out
    @user = current_user
     @user.update(is_deleted: true)
     reset_session
     redirect_to root_path
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :name_kana, :email, :post_code, :address, :phone_number, :is_deleted)
  end

end
