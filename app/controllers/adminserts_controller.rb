class AdminsertsController < DeviseController
  #
  def change
    @user = User.find(params[:id])
  end

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    novoUsuario = User.new(admuser_params)
    if novoUsuario.save
      #
    else
      #
    end
    redirect_to users_path
  end

  # GET /resource/edit
  def edit
    render :edit
  end

  def update
    user_params = params[:user]
    @user = User.find(params[:user][:id])
    byebug
    resource.update_without_password(user_params)
    redirect_to users_path
  end

  # DELETE /resource
  def destroy
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed if is_flashing_format?
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
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

  def account_update_params
    devise_parameter_sanitizer.sanitize(:account_update)
  end

   # Never trust parameters from the scary internet, only allow the white list through.
  def admuser_params
    #params.require(:aluno).permit!
    #params.require(:user).permit(:name, :email)
    #params[:user].permit(:first_name, :last_name, :address)
    params.require(:user).permit!
  end

end
