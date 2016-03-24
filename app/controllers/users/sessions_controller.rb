class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
  # before_action :sign_out, only: [:destroy]
  include Tubesock::Hijack
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    # byebug
    super
    log_in current_user
  end

  # DELETE /resource/sign_out
  def destroy
    current_user.update_attribute(:last_sign_out_at, Time.now)
    user = current_user
    # PrivatePub.publish_to("/messages/new", message: @message.to_json)
    super
    log_out(user)
  end

  def log_out user
    PrivatePub.publish_to("/sign_out", user: user.to_json)
  end

  def log_in user
    PrivatePub.publish_to("/sign_in", user: user.to_json)
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
