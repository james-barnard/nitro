module BotHelper
  def display_image(message, img)
    message.reply(image_attachment(img))
  end

  def image_attachment(img)
    {
      attachment: {
        type: 'image',
        payload: {
          url: image_url(img)
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

  def mnu_element(title, image)
    {
      title:     title,
      #image_url: image_url(image),
      default_action: default_action(image),
      buttons:   [mnu_button(title)]
    }
  end

  def default_action(img)
    {
      type: "web_url",
      url: image_url(img),
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

  def image_url(path)
    "https://53c81b8b.ngrok.io/#{path}"
  end
end
