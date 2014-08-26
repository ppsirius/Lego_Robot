class CreditsController < ApplicationController
  before_action :authenticate_user!

def new

end

  def create

credit_card = ActiveMerchant::Billing::CreditCard.new(
  :number     => (params[:number]),
  :month      => (params[:month]),
  :year       => (params[:year]),
  :first_name => (params[:first_name]),
  :last_name  => (params[:last_name]),
  :verification_value  => (params[:verification_value]),
)


if credit_card.valid?
  # Create a gateway object to the TrustCommerce service
  gateway = ActiveMerchant::Billing::AuthorizeNetGateway.new(
    :login    => '72R35SLz67hx',
    :password => '3b5EmmzSG585GS99'
  )

  # Authorize for $10 dollars (1000 cents)
  response = gateway.authorize(1000, credit_card)

  	if response.success?

	    gateway.capture(1000, response.authorization)
	     current_user.credits.create(:credit => true)
	 	redirect_to root_path
  	else
    raise StandardError, response.message
  	end
  	render :new

end

end

end



