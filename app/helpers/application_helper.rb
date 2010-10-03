module ApplicationHelper
  # Return a title on a per-page basis.
  # This module is actually available to the application because rails makes it part of a mixin
  # the @title iv will come from the other half of the mixin (ie PagesController).??
  #The funciton title is then used in the view (actually the application layout)
  def title
    base_title = "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

end
