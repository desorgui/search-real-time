require 'string/similarity'

class SearchesController < ApplicationController
  skip_before_action :verify_authenticity_token
  # GET /searches or /searches.json
  def index
    @searches = Search.all
  end

  # POST /searches or /searches.json
  def create
    
      @search = Search.new(search_params)
      @search.user_ip = request.remote_ip
      respond_to do |format|
        if @search.save
          format.html { redirect_to articles_url, notice: 'Your search was successfully recorded.' }
          format.json { render @articles, status: :created, location: @searches }
        else
          format.json { render json: @search.errors, status: :unprocessable_entity }
        end
      end
  end
end
