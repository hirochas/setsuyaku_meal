class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @resipes = @customer.resipes
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    Customer.update(customer_params)
    redirect_to admin_customer_path(customer.id)
  end

   private
  def customer_params
    params.require(:customer).permit(:name, :email, :is_deleted, :encrypted_password)
  end
end
