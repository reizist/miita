class StaticsController < ApplicationController
  def home
    @articles = Article.feed
  end
end
