class StaticsController < ApplicationController
  def home
    @articles = Article.includes(:tags).feed.page(params[:page])
  end
end
