class DramasController < ApplicationController

	def index
		@dramas = Drama.all
	end

	def show
    Drama.get_drama(params[:id]) unless Drama.exists?(params[:id])
    @drama = Drama.find(params[:id])
  end

	def search
    @dramas = TVDB.search(params[:search])

    if @dramas.empty?
      redirect_to root_path
      flash[:error] = "No show found!"
    end
  end

end
