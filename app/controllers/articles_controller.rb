class ArticlesController < ApplicationController
  def show
    # @ instance variables
    @article = Article.find params[:id]
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new params.require(:article).permit(:title, :description)
    if @article.save
      # notice and alert are used values
      flash[:notice] = "Article was created successfully."
      # redirect after creation
      redirect_to @article
      # above is shortcut for: redirect_to article_path(@article)
    else
      # if it hits a validation error
      render :new, status: 422
    end
  end

end
