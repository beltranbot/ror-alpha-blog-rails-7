class ArticlesController < ApplicationController
  def show
    # @ instance variables
    @article = Article.find params[:id]
  end
end
