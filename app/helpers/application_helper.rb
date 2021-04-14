module ApplicationHelper
  flash_messages = []

  def flash_notifications
    flash_messages = []

    flash.each do |type, message|
      type = 'success' if type == 'success'
      type = 'error' if type == 'alert' || type == 'danger'
      text = "toastr['#{type}']('#{message}');"
      flash_messages << text.html_safe unless message.blank?
    end
  end

  "<script>$(function(){ #{ flash_messages.join("\n") } });</script>".html_safe if flash_messages.any?
end
