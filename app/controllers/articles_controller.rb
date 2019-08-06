require 'open-uri'
require 'json'

class ArticlesController < ApplicationController
before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all.reverse_order
  end

   def show; end

   def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def edit; end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def parse
    url = "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"
    word_serialized = open(url).read
    word = JSON.parse(word_serialized)
  end

end
