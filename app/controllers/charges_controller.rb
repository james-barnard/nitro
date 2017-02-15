class ChargesController < ApplicationController
  def select
    @fbuser = FbUser.find params[:fbuser]
    @product_load = ProductLoad.find params[:product_load_id]
    @product = @product_load.local_product.product
    @amount = ENV['MSRP']
  end

  def create
    # Amount in cents
    @amount = ENV['MSRP']
    @display_amount = "$#{@amount.to_i / 100}"

    fb_user = FbUser.find params["fbuser"]["id"]
    product_load = ProductLoad.find params["product_load"]["id"]
    product_load.purchases.create(fb_user_id: fb_user.id, pos_type: :stripe, amount: @amount)

    card_service = CreditCardService.new({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      amount: @amount
    })
    customer = card_service.create_customer
    fb_user.update(customer_id: customer.id)

    card_service.charge
    VendingMachinePourService.enable(
      product_load.vending_machine.device_id,
      product_load.valve)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
