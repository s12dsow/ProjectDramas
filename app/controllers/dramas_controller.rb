class DramasController < ApplicationController

	def index
		@dramas = Drama.all
	end

	def show
    Drama.get_drama(params[:id]) unless Drama.exists?(params[:id])
    @drama = Drama.find(params[:id])
  end

	def search
    terms = params[:search].split(' ').join("%20")
    xml = HTTParty.get("http://www.thetvdb.com/api/GetSeries.php?seriesname=" + terms)
    

    if xml["Data"].nil?
      redirect_to root_path
      flash[:error] = "No show found!"
    else
      result = xml["Data"]["Series"]
    end

    if result.class == Hash
      @dramas = [result]
    else
      @dramas = result
    end
  end

end
