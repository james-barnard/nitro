require 'stripe'

class CreditCardService
  def initialize(params)
    @email  = params[:email]
    @source = params[:source]
    @amount = params[:amount]
  end

  def charge
    external_charge_service.create(charge_attributes)
  end

  def create_customer
    @customer = external_customer_service.create(customer_attributes)
  end

  private

  attr_reader :source, :amount, :email, :customer

  def external_charge_service
    Stripe::Charge
  end

  def external_customer_service
    Stripe::Customer
  end

  def charge_attributes
    {
      customer:    customer.id,
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
