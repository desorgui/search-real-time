require 'socket'

class ArticlesController < ApplicationController
  # GET /articles or /articles.json
  def index
    @ip = Socket.ip_address_list.detect(&:ipv4_private?).ip_address
    @articles = Article.all
    if params[:query].present?
      @articles = Article.search_by_article_content(params[:query])
      update_articles
    end
    @articles = Article.all
  end

  def update_articles
    render turbo_stream: turbo_stream.replace('articles', partial: 'articles/articles', locals: { articles: @articles })
  end
end
