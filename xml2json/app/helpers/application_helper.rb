# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def selected(action = "")
    action == action_name ? "selected" : ""
  end

  def image_for_api(api, opts = {})
    api.image.nil? ? image_tag("apis/default.png", opts) : image_tag(api.img, opts)
  end
end

