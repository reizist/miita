class StaticsController < ApplicationController
  def home
    @articles = Article.all
  end
end
