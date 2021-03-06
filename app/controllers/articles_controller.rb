class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    show_article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  def edit
    show_article
  end

  def update
    @article = Article.find(params[:id])
    @article.update(title: params[:article][:title], description: params[:article][:description])
    redirect_to article_path(@article)
  end

  private

    def show_article
      @article = Article.find(params[:id])
    end
end
