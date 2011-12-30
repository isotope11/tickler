module ApplicationHelper
  def display_flash(name, msg)
    case name.to_s
    when "notice" then
      content_tag :div, msg, :class => "alert-message success"
    when "alert" then
      content_tag :div, msg, :class => "alert-message warning"
    else
      content_tag :div, msg, :class => "alert-message info"
    end
  end
end
