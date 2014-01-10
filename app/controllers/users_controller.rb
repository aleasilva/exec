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
    
end