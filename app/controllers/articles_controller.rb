class ArticlesController < ApplicationController
  before_action :find_article, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @articles = Article.all.order('created_at DESC')
  end

  def new
    @article = current_user.articles.build
  end

  def show

  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article, notice: 'Successfully created a new article'
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end




  private

  def article_params
    params.require(:article).permit(:title, :content, :url)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
