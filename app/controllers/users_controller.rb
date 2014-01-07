class UsersController < ApplicationController
  
  def index
    Rails.logger.info("INDEX**********Registration Controller ****")
    @users = User.all
  end
    
end