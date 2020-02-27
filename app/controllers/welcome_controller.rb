# frozen_string_literal: true

# Welcome controller
class WelcomeController < ApplicationController
  def index
    return unless logged_in?

    @article = current_user.articles.build
    @feed_items = current_user.feed.paginate(page: params[:page])
  end
end
