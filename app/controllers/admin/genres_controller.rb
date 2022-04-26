class Admin::GenresController < ApplicationController
  
  def create
    @genre = Genre.new(genr_params)
    @genre.user_id = current_user.id
    @genre.save
    redirect_to genr_params
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
end
