module UsersHelper
  def gravatar_for(user, option = { size: 80 })
    size = option[:size]
    if user.image.attached?
      image_tag(url_for(user.image), alt: user.name, class: "gravatar", size: "#{size}x#{size}")
    else
      gravatar_url = "https://lippianfamilydentistry.net/wp-content/uploads/2015/11/user-default.png"
      image_tag(gravatar_url, alt: user.name, class: "gravatar", size: "#{size}x#{size}")
    end
  end

  def gravatar_for_header(user, size_h, size_w)
    if user.image.attached?
      image_tag(url_for(user.image), alt: user.name, class: "gravatar gravatar-header", size: "#{size_h}x#{size_w}")
    else
      gravatar_url = "https://lippianfamilydentistry.net/wp-content/uploads/2015/11/user-default.png"
      image_tag(gravatar_url, alt: user.name, class: "gravatar gravatar-header", size: "#{size_h}x#{size_w}")
    end
  end
end