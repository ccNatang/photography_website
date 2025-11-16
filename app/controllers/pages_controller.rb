class PagesController < ApplicationController
  def home
    @featured_photos = Photo.order("RANDOM()").limit(6)
  end
end
