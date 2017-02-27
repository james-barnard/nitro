class ChargesController < ApplicationController
  def thanks
    sender = params[:sender_id]
    FacebookMessengerConversationService.new(sender).thank_you unless sender.nil?
  end

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

    @fb_user = FbUser.find params["fbuser"]["id"]
    @sender_id = @fb_user.sender_id
    product_load = ProductLoad.find params["product_load"]["id"]
    product_load.purchases.create(fb_user_id: @fb_user.id, pos_type: :stripe, amount: @amount)

    card_service = CreditCardService.new({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      customer_id: @fb_user.customer_id,
      amount: @amount
    })

    if @fb_user.customer_id.nil? || @fb_user.customer_id == 0
      customer = card_service.create_customer
      @fb_user.update(customer_id: customer.id)
    end

    card_service.charge

    VendingMachinePourService.enable(
      product_load.vending_machine.device_id,
      product_load.valve
    )
    product_load.increment!(:enabled)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_select_path
  end
end
