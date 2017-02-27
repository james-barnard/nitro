require 'stripe'

class CreditCardService
  def initialize(params)
    @email  = params[:email]
    @source = params[:source]
    @amount = params[:amount]
    @customer_id = params[:customer_id]
  end

  def charge
    external_charge_service.create(charge_attributes)
  end

  def create_customer
    @customer = external_customer_service.create(customer_attributes)
    @customer_id = customer.id
  end

  private

  attr_reader :source, :amount, :email, :customer, :customer_id

  def external_charge_service
    Stripe::Charge
  end

  def external_customer_service
    Stripe::Customer
  end

  def charge_attributes
    {
      customer:    customer_id,
      description: 'NitrøKaffe',
      currency:    'usd',
      amount:      amount
    }
  end

  def customer_attributes
    {
      email: email,
      source: source
    }
  end
end
