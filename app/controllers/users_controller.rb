class UsersController < ApplicationController
  
  def index
    Rails.logger.info("INDEX**********Registration Controller ****")
    @users = User.all
    @users_grid = initialize_grid(@users)
  end
    
end