class PagesController < ApplicationController
  # this is a react comment
  def home
    @featured_photos = Photo.order("RANDOM()").limit(6)
  end

  def about
  end
end
