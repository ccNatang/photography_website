class Admin::GalleriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_gallery, only: [ :edit, :update, :destroy ]

  def index
    @galleries = Gallery.all.order(created_at: :desc)
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)

    if @gallery.save
      redirect_to admin_galleries_path, notice: "Gallery was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # This action is now
    # intentionally empty because the
    @photos = @gallery.photos.order(created_at: :asc)
  end

  def update
    if @gallery.update(gallery_params)
      redirect_to admin_galleries_path, notice: "Gallery was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gallery.destroy
    redirect_to admin_galleries_path, notice: "Gallery was successfully deleted."
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:title, :description)
  end
end
