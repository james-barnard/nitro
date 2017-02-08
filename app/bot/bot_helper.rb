require 'action_view'

module BotHelper
  #include ActionView::Helpers

  def display_image(message, img)
    message.reply(image_attachment(img))
  end

  def image_attachment(img)
    {
      attachment: {
        type: 'image',
        payload: {
          url: full_path(img)
        }
      }
    }
  end

  def product_menu(mnu_elements)
    {
      attachment: {
        type: 'template',
        payload: {
          template_type: 'generic',
          elements: mnu_elements
        }
      }
    }
  end

  def mnu_element(title, product_load_id)
    {
      title:     title,
      image_url: full_path("/assets/ThumbNo3-573x300.png"),
      default_action: default_action(product_load_id)
    }
  end

  def default_action(product_load_id)
    {
      type: "web_url",
      url: link_to_buy(product_load_id, @fbuser),
      messenger_extensions: true,
      webview_height_ratio: "tall"
      #,fallback_url: "https://peterssendreceiveapp.ngrok.io/"
    }
  end

  def mnu_button(product)
    {
      type: 'postback',
      title: "I want #{product}",
      payload: "BUY#{product}"
    }
  end

  def link_to_buy(product_load_id, fbuser)
    full_path("charges/select?product_load_id=#{product_load_id}&fbuser=#{fbuser.id}")
  end

  def full_path(path)
    #path = ActionView::Helpers::AssetUrlHelper.url_to_image(path)
    "https://53c81b8b.ngrok.io/#{path}"
  end
end
