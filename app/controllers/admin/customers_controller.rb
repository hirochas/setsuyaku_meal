class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def unsubscribe
  end

   private
  def customer_params
    params.require(:customer).permit(:name, :email,:encrypted_password, :is_deleted)
  end
end
