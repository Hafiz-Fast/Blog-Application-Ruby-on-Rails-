class ArticlesController < ApplicationController
  def index
    @articles = Article.all       # Instance Variable
  end

  def show
    @article = Article.find(params[:id])
  end

  # new and create for "Create"
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  # edit and update for "Update"

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Using strong params to restrict access to parameters
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
