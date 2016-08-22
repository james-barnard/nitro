module BotHelper
  def sender_id
    fb_params.first_entry.sender_id
  end

  def fb_request(template)
    Messenger::Request.new(template, sender_id)
  end

  def request_text(text)
    fb_request(Messenger::Elements::Text.new(text: "#{text}"))
  end

  def discovery1
      request_text("I can show you insanely great NitroKaffe selections or just chat about nitro coffee.")
  end

  def choices1
    Messenger::Templates::Buttons.new(
      text: "I can show you insanely great NitroKaffe selections or just chat about nitro coffee.",
      buttons: [btn_menu, btn_chat]
    )
  end

  def choices2
    Messenger::Templates::Buttons.new(
      text: "I have a couple of great selections including something special from Novo Coffee in Denver!  May I show them to you?",
      buttons: [btn_menu]
    )
  end

  def menu
    Messenger::Templates::Generic.new(
      elements: [product1, product2]
    )
  end

  def product1
    product_title = "Kaffe N°2"
    product_desc = "is a dark roast Suliwasi African blend that yields a rich and satisfying nitro coffee with a thick mocha crema"

    Messenger::Elements::Bubble.new(
      title: product_title,
      subtitle: product_desc,
      image_url: view_context.image_url("brewM1.png"),
      buttons: [btn_buy("brewM1")]
    )
  end

  def product2
    product_title = "Kaffe N°3"
    product_desc = "is a blend of medium roast Central and South American Robusta coffees, cold brewed for 15 hours. Its distinctive cascading body and carmel colored crema evoke a creamy satisfying chocolate mouthfeel. Our signature nitro coffee formula is only available from me"

    Messenger::Elements::Bubble.new(
      title: product_title,
      subtitle: product_desc,
      image_url: view_context.image_url("brewM1.png"),
      buttons: [btn_buy("brewM2")],
    )
  end

  def thank_you
    product_title = "Your pour is ready!"
    product_desc = "Hold your glass under the spout and press the POUR button for a full second"

    Messenger::Elements::Bubble.new(
      title: product_title,
      subtitle: product_desc,
      image_url: view_context.image_url("SimpleThankYou.png"),
      buttons: [btn_menu, btn_chat]
    )
  end

  def btn_buy(product)
    Messenger::Elements::Button.new(
      type: 'postback',
      title: "I want #{product}",
      value: product
    )
  end

  def btn_menu
    Messenger::Elements::Button.new(
      type: 'postback',
      title: 'NitroKaffe',
      value: 'menu'
    )
  end

  def btn_chat
    Messenger::Elements::Button.new(
      type: 'postback',
      title: 'Just Chat',
      value: 'chat1'
    )
  end

  def enable(selection)
    brew = { brew1: product1, brew2: product2 }[selection]
    puts "DEBUG:enable:#{brew}"

    ParticleController.new.enable

    Messenger::Templates::Generic.new(
      elements: [thank_you]
    )
  end
end
