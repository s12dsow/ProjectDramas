class DramasController < ApplicationController
  def index
    @dramas = Drama.all
  end

  def show
    @drama = Drama.find(params[:id])
  end

  def search
    @dramas = TVDB.search(params[:search])
    redirect_to root_path && flash[:error] = "No show found!" if @dramas.empty?
  end
end
