class UsersController < ApplicationController
  
  def index
    Rails.logger.info("INDEX**********Registration Controller ****")
    @users = User.all
    @users_grid = initialize_grid(@users)
  end
    
  def change
    @user = User.find(params[:format])
    Rails.logger.info("CHANGE**********Registration Controller ****")    
  end
  
  
  # PUT /resource
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
  def update

    @user = User.find(params[:id])
    if @user.update(user_params)
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
    
  end
  
   # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email)
  end

  # https://github.com/plataformatec/devise/wiki/How-To%3a-Allow-users-to-edit-their-account-without-providing-a-password
  def needs_password?(user, params)
    params[:password].present?
  end
    
end