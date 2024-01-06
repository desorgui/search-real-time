class ArticlesController < ApplicationController
  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  end
