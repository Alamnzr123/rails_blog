class ArticlesController < ApplicationController
  # adding security with the top of code
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

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
    @article = Article.new(article_params)

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
      params.require(:article).permit(:title, :body, :status)
    end
end
