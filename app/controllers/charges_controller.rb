class ChargesController < ApplicationController
  def new
  end
  
  def create
    begin
      # Amount in cents
      @amount = 50
    
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    # binding.pry
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'usd',
      })

      current_user.update_columns(user_type: "active")  
      redirect_to user_path(current_user)
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to user_path(current_user)
    end
  end
end
