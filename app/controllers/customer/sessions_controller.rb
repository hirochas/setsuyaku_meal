# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    #binding.pry
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer.nil? || @customer.is_deleted == true
      redirect_to new_customer_session_path
    else
      super
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # def customer_state
  #     @customer = Customer.find_by(email: params[:customer][:email])
  #     return if !@customer
  #     if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted
  #         redirect_to new_customer_registration_path
  #     end
  # end
end
