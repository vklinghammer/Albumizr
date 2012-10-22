class AlbumsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to albums_path
    else
      render 'new'
    end
  end

  def index
    @albums = current_user.albums.search(params[:search])
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(params[:album])
      redirect_to albums_path
    else
      render 'edit'
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash[:notice] = "Album deleted."
    redirect_to albums_path
  end

  private
    def correct_user
      @album = current_user.albums.find_by_id(params[:id])
      redirect_to root_path, notice: "You are not allowed to do this." unless !@album.nil?
    end

end