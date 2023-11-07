module UsersHelper
  def gravatar_for(user, option = { size: 80 })
    size = option[:size]
    gravatar_url = "https://lippianfamilydentistry.net/wp-content/uploads/2015/11/user-default.png"
    image_tag(gravatar_url, alt: user.name, class: "gravatar", size: "#{size}x#{size}")
  end
end
