# frozen_string_literal: true

# Tests for article controller
class ArticlesController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: :destroy

  def create
    @article = current_user.articles.build(article_params)
    @article.images.attach(params[:article][:images])

    if @article.save
      flash[:success] = 'Article saved!'
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'welcome/index'
    end
  end

  def destroy
    @article.destroy
    flash[:success] = 'Article deleted'
    # redirect_to request.referrer || root_url
    redirect_back(fallback_location: root_url)
  end

  private

  def article_params
    params.require(:article).permit(:content, :images)
  end

  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to root_url if @article.nil?
  end
end
