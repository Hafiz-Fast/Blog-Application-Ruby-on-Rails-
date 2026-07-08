class ArticlesController < ApplicationController
  # index and show for "GET"
  def index
    @articles = Article.all       # Instance Variable
  end

  def show
    @article = Article.find(params[:id])
  end

  # new and create for "CREATE"
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

  # edit and update for "UPDATE"
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

  # destroy for "DESTROY"
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  # Using strong params to restrict access to parameters
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
