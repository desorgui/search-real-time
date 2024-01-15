require 'socket'

# Searches controller
class SearchesController < ApplicationController
  skip_before_action :verify_authenticity_token
  # GET /searches or /searches.json
  def index
    @ip = Socket.ip_address_list.detect(&:ipv4_private?).ip_address
    @searches = Search.group(:search_query).order(count: :desc).count
  end

  # POST /searches or /searches.json
  def create
    recent_search = Search.where(user_ip: params[:search][:user_ip]).last || Search.new(search_query: ' ')
    p params[:search][:user_ip]
    if params[:search][:search_query].include? recent_search.search_query
      recent_search.update(search_query: params[:search][:search_query], user_ip: params[:search][:user_ip])
    else
      search_params = params.require(:search).permit(:search_query, :user_ip)
      @search = Search.new(search_params)
      respond_to do |format|
        if @search.save
          format.html { redirect_to articles_url, notice: 'Your search was successfully recorded.' }
          format.json { render @articles, status: :created, location: @searches }
        else
          format.json { render json: @search.errors, status: :unprocessable_entity }
          p @search.errors
        end
      end
    end
  end
end
