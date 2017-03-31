require 'action_view'

module MenuHelper
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

  def mnu_element(title, product_load, fb_user)
    thumb_url = ENV['RACK_ENV'] == 'development' ? full_path(product_load.menu_thumb) : product_load.menu_thumb
    puts "image_url: #{thumb_url}"
    {
      title:     title,
      image_url: thumb_url,
      default_action: default_action(product_load.id, fb_user)
    }
  end

  def default_action(product_load_id, fb_user)
    puts "link_to_buy: #{link_to_buy(product_load_id, fb_user)}"
    {
      type: "web_url",
      url: link_to_buy(product_load_id, fb_user),
      messenger_extensions: true,
      webview_height_ratio: "full"
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

  def link_to_confirm(fb_user)
    full_path("charges/confirm?fbuser=#{fb_user.id}")
  end

  def link_to_buy(product_load_id, fb_user)
    full_path("charges/select?product_load_id=#{product_load_id}&fbuser=#{fb_user.id}")
  end

  def full_path(path)
    #path = ActionView::Helpers::AssetUrlHelper.url_to_image(path)
    #"https://53c81b8b.ngrok.io/#{path}"
    "#{ENV["APPDOMAIN"]}/#{path}"
  end
end
