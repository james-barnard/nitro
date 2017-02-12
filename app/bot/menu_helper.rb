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
    puts "image_url: full_path(#{product_load.menu_thumb}),"
    {
      title:     title,
      image_url: full_path(product_load.menu_thumb),
      default_action: default_action(product_load.id, fb_user)
    }
  end

  def test_menu()
    {
      attachment: {
        type: 'template',
        payload: {
          template_type: 'generic',
          elements: [{
            title:     'test',
            image_url: full_path("/assets/ThumbNo3-573x300.png"),
            default_action: {
              type: "web_url",
              url: link_to_ty(),
              messenger_extensions: true,
              webview_height_ratio: "tall"
            }
          }]
        }
      }
    }
  end

  def test_action()
  end

  def default_action(product_load_id, fb_user)
    {
      type: "web_url",
      url: link_to_buy(product_load_id, fb_user),
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

  def link_to_ty()
    full_path("charges/thanks")
  end

  def link_to_buy(product_load_id, fb_user)
    full_path("charges/select?product_load_id=#{product_load_id}&fbuser=#{fb_user.id}")
  end

  def full_path(path)
    #path = ActionView::Helpers::AssetUrlHelper.url_to_image(path)
    "https://53c81b8b.ngrok.io/#{path}"
  end
end
