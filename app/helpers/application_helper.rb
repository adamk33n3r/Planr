module ApplicationHelper
  def app_version
    #Planr::Application.config.app_version
    Rails.application.config.app_version
  end
  def app_name
    Rails.application.class.to_s.split("::").first
  end
  #def link_to(name = nil, options = nil, html_options = nil, &block)
  #  super(name, options.nil? ? name : options, html_options, &block)
  #end
  def blink_to(body, url, html_options = {})
    if html_options[:class]
      html_options[:class] = "button " + html_options[:class]
    else
      html_options[:class] = "button"
    end
    link_to body, url, html_options
  end
  
  def boolean(bool)
    icon = bool ? "check_small.png" : "cross_small.png"
    image_tag "icons/#{icon}", size: "12"
  end
  
  def gravatar_url(user, size=128)
    gravatar_id = Digest::MD5.hexdigest user.email.downcase
    "http://gravatar.com/avatar/#{gravatar_id}?d=identicon&s=#{size}"
  end
  
  def div_to(text, link, options:{}, link_options:{})
    content_tag :div, options do
      link_to text, link, link_options
    end
  end
  
  def navbar_link(text, link, link_options: {})
    if link.is_a? String
      cont = URI.split(link)[5].split("/")
      if cont == []
        cont = "main"
      else
        cont = cont[1]
      end
      content_tag :li, :class => (params[:controller] == cont) ? "active" : "" do
        link_to text, link, link_options
      end
    else
      content_tag :li, :class => current_page?(link) ? "active" : "" do
        link_to text, link, link_options
      end
    end
  end
end
