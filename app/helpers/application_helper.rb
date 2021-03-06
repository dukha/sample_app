module ApplicationHelper
  # Return a title on a per-page basis.
  # This module is actually available to the application because rails makes it part of a mixin
  # the @title iv will come from the other half of the mixin (ie PagesController).??
  #The funciton title is then used in the view (actually the application layout)
  def title
    base_title = "Sample Rails"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "Sample App header image not found", :class => "round")
  end
end
