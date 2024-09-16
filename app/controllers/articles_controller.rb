class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  # read
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  # create
  def create 
    @article = Article.new(title: "...", body: "...")

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  # update
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # delete
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

    # add strong_parameter
    private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
