class ChargesController < ApplicationController
  def thanks
    sender = params[:sender_id]
    FacebookMessengerConversationService.new(sender).thank_you unless sender.nil?
    return
  end

  def menu
    sender = params[:sender_id]
    unless sender.nil?
      FacebookMessengerConversationService.new(sender).push_menu and return
    end
  end

  def confirm
    @fbuser = FbUser.find params[:fbuser]
    @product_load = @fbuser.purchases.last.product_load
    @product = @product_load.local_product.product
    @location = @product_load.vending_machine.location.concise_address
    @amount = ENV['MSRP']
  end

  def select
    @fbuser = FbUser.find params[:fbuser]
    @product_load = ProductLoad.find params[:product_load_id]
    @product = @product_load.local_product.product
    machine = @product_load.vending_machine
    @amount = price(machine)
    puts "select: amount: #{@amount}"
  end

  def create
    @fb_user = FbUser.find params["fbuser"]["id"]
    @sender_id = @fb_user.sender_id
    product_load = ProductLoad.find params["product_load"]["id"]
    machine = product_load.vending_machine
    @amount = price(machine)
    @display_amount = "$#{@amount.to_f / 100}"
    product_load.purchases.create(fb_user_id: @fb_user.id, pos_type: :stripe, amount: @amount)

    card_service = CreditCardService.new({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      customer_id: @fb_user.customer_id,
      amount: @amount
    })

    if @fb_user.customer_id.nil? || @fb_user.customer_id == 0 || @fb_user.last4.nil?
      puts "creating customer"
      customer = card_service.create_customer
      @fb_user.update(customer_id: customer.id, last4: card_service.last4) unless customer.nil?
    end

    card_service.charge unless @amount.to_i == 0

    VendingMachinePourService.enable(
      product_load.vending_machine.device_id,
      product_load.valve
    )
    product_load.increment!(:enabled)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_select_path
  end

  def price(machine)
    @amount = ENV['MSRP']

    @amount = machine.free_at?(Time.now) ? 0 : @amount
  end
end
