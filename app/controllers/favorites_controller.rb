class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite, only: [:show, :destroy]


  def index
    @favorites = current_user.favorites
  end

  def new
    @favorite = Favorite.new(favorite_params)
  end

  def show
  end
  
  # def create
  #   @entry = Entry.find(params[:entry_id])
  #   @favorite = @entry.favorites.build(user_id: current_user.id)
  #   @favorite.save
  # end


  def destroy
    @favorite.destroy
    redirect_to favorites_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.fetch(:favorite, {})
    end
end
