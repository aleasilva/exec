class UsersController < ApplicationController
  
  def index
    Rails.logger.info("INDEX**********Registration Controller ****")
    @users = User.all
    @users_grid = initialize_grid(@users)
  end
    
  def change
    Rails.logger.info("CHANGE**********Registration Controller ****")    
  end    
    
end