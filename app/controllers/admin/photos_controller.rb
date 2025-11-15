class Admin::PhotosController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_gallery

  def new
    @photo = @gallery.photos.build
  end

  def create
    @photo = @gallery.photos.build(photo_params)

    if @photo.save
      redirect_to edit_admin_gallery_path(@gallery), notice: "Photo was sucessefully uploaded."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @photo = @gallery.photos.find(params[:id])
    @photo.destroy
    redirect_to edit_admin_gallery_path(@gallery), notice: "Photo was successfully deleted."
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :image)
  end
end
