class AdminsertsController < DeviseController
#class AdmusersController < Devise::RegistrationsController
  #before_action :admuser_params, only: [:show, :edit, :update, :destroy]
  #prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ,:update]
  #prepend_before_filter :authenticate_scope!, :only => [:destroy]

  def index
    Rails.logger.info("INDEX**********Registration Controller ****")
    @users = User.all
    @users_grid = initialize_grid(@users,per_page: 10)
  end

  def change
    @user = User.find(params[:id])
  end

  # GET /resource/sign_up
  def new
    @user = User.new
    # @aluno.nascimento ==  Date.today

    Rails.logger.info("NEW**********Registration Controller ****")
    # build_resource({})
    # respond_with self.resource
  end

  # POST /resource
  def create
    Rails.logger.info("CREATE**********Registration Controller 28 ****")

    novoUsuario = User.new(admuser_params)
    #
    # respond_to do |format|
    #   if @aluno.save
    #     format.html { redirect_to @aluno, notice: 'Aluno was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @aluno }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @aluno.errors, status: :unprocessable_entity }
    #   end
    # end

    # build_resource(sign_up_params)

   if novoUsuario.save
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
    user_params = params[:user]
    @user = User.find(params[:user][:id])
    byebug
    resource.update_without_password(user_params)

    #if @user.update(user_params)
      # Sign in the user by passing validation in case his password changed
      #sign_in @user, :bypass => true
      redirect_to users_path
    #else
    #  render "edit"
    #end
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
