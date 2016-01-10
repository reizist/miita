class StaticsController < ApplicationController
  def home
    @articles = Article.feed.page(params[:page])
  end
end
