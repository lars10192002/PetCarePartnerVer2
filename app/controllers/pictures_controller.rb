class PicturesController < ApplicationController
  before_action :authenticate_user!
  def index
    @sitter = Sitter.find_by(id: params[:sitter_id])
    
    # byebug
  end
  def show
    @sitter = Sitter.find_by(id: params[:sitter_id])
    @picture = Picture.find(params[:id])#找單張圖片
    
    # byebug
  end
  def new
    @picture = Picture.new
    @current_sitter = Sitter.find_by("name == '#{current_user.name}'")
    # byebug
  end
  def create
    @picture = Picture.new(picture_params)
    @current_sitter = Sitter.find_by("name == '#{current_user.name}'")
    if @picture.save
      redirect_to sitter_pictures_path(params[:sitter_id]), notice: '圖片上傳成功'
    else
      render :new
    end
    # byebug
  end

  private
  def picture_params
    params.require(:picture).permit(:sitter_id, :pic, :user_id)
    # params.require(:sitter).permit( :address, :slogan, :price, :square_meters, :pet_limit, :pic)
  end
end