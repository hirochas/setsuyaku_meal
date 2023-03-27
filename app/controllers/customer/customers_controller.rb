class Customer::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @resipes = @customer.resipes
  end


  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end

  def withdraw
    customer = current_customer
    customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end



  private
  def customer_params
    params.require(:customer).permit(:name, :email, :is_deleted, :encrypted_password)
  end
end


