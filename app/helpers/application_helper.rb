module ApplicationHelper
  include LikesHelper

  def flash_color(message_type)
    case message_type
    when "notice"
      "#success"  # Green background color for notices
    when "alert"
      "danger"  # Red background color for errors
    else
      "#ffffff"  # Default background color
    end
  end
end
