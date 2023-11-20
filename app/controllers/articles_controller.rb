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

  def edit
    @article = Article.find params[:id]
  end

  def create
    @article = Article.new params.require(:article).permit(:title, :description)
    if @article.save
      # notice and alert are used values
      flash[:notice] = "Article was created successfully."
      # redirect after creation
      redirect_to @article
      # above is shortcut for: redirect_to articles_path(@article)
    else
      # if it hits a validation error
      render :new, status: 422
    end
  end

  def update
    @article = Article.find params[:id]
    if @article.update params.require(:article).permit(:title, :description)
      flash[:notice] = "Article was updated successfully."
      # redirect after creation
      redirect_to @article
    else
      render :edit, status: 422
    end
  end

  def destroy
    @article = Article.find params[:id]
    @article.destroy
    redirect_to articles_path
  end

end
