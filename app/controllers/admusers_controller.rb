class AdmusersController < DeviseController
  #prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ,:update]
  #prepend_before_filter :authenticate_scope!, :only => [:destroy]

  def index
    Rails.logger.info("INDEX**********Registration Controller ****")
    @users = User.all
    @users_grid = initialize_grid(@users)
  end
    
  def change
    @user = User.find(params[:id])
    Rails.logger.info("CHANGE**********Registration Controller ****")    
  end


  # GET /resource/sign_up
  def new
    Rails.logger.info("NEW**********Registration Controller ****")    
    build_resource({})
    respond_with self.resource
  end

  # POST /resource
  def create
    Rails.logger.info("CREATE**********Registration Controller 28 ****")
    build_resource(sign_up_params)

   if resource.save
 #    yield resource if block_given?
#        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
#        expire_data_after_sign_in!

#     if resource.active_for_authentication?
#       set_flash_message :notice, :signed_up if is_flashing_format?
#       #Não autenticar apos a insercao
#       #sign_up(resource_name, resource)
#       respond_with resource, :location => after_sign_up_path_for(resource)
#        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ? :update_needs_confirmation : :updated
#        set_flash_message :notice, flash_key

#      else
#        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
#        expire_data_after_sign_in!
#        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
#      end
    else
#      set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
#      clean_up_passwords resource
#      respond_with resource
    end
    redirect_to users_path
  end

  # GET /resource/edit
  def edit
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Sign in the user by passing validation in case his password changed
      #sign_in @user, :bypass => true
      redirect_to users_path
    else
      render "edit"
    end    
  end

  # PUT /resource
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
  def updatePadrao
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    if update_resource(resource, account_update_params)
      yield resource if block_given?
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ? :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, :bypass => true
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  # DELETE /resource
  def destroy
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed if is_flashing_format?
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    expire_data_after_sign_in!
    redirect_to new_registration_path(resource_name)
  end

  protected

  def update_needs_confirmation?(resource, previous)
    resource.respond_to?(:pending_reconfirmation?) &&
      resource.pending_reconfirmation? &&
      previous != resource.unconfirmed_email
  end

  # By default we want to require a password checks on update.
  # You can overwrite this method in your own RegistrationsController.
  def update_resource(resource, params)
    resource.update_with_password(params)
  end

  # Build a devise resource passing in the session. Useful to move
  # temporary session data to the newly created user.
  def build_resource(hash=nil)
    self.resource = resource_class.new_with_session(hash || {}, session)
  end

  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  # The path used after sign up. You need to overwrite this method
  # in your own RegistrationsController.
  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end

  # The path used after sign up for inactive accounts. You need to overwrite
  # this method in your own RegistrationsController.
  def after_inactive_sign_up_path_for(resource)
    respond_to?(:root_path) ? root_path : "/"
  end

  # The default url to be used after updating a resource. You need to overwrite
  # this method in your own RegistrationsController.
  def after_update_path_for(resource)
    signed_in_root_path(resource)
  end

  # Authenticates the current scope and gets the current resource from the session.
  def authenticate_scope!
    send(:"authenticate_#{resource_name}!", :force => true)
    self.resource = send(:"current_#{resource_name}")
  end

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  def account_update_params
    devise_parameter_sanitizer.sanitize(:account_update)
  end
  
   # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email)
  end
  
end