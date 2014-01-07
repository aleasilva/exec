class RegistrationsController < Devise::RegistrationsController
  after_filter :index
  
  def index
    Rails.logger.info("INDEX**********Registration Controller ****")
    @users = User.all
  end
  
  
  def new
    Rails.logger.info("NEW**********Registration Controller ****")
    super
  end

  def create
    # add custom create logic here
    Rails.logger.info("CRIACAO******Registration Controller ****")
    super
  end

  def update
     Rails.logger.info("UPDATE******Registration Controller ****")
     super
  end
  
  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    #Nao logar o usuario que acabou de se registrar.
    #sign_in(resource_name, resource)
  end
  
  # The path used after sign up. You need to overwrite this method
  # in your own RegistrationsController.
  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end
    
end