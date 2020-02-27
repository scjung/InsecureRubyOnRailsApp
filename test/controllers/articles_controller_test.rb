# frozen_string_literal: true

require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @article = articles(:orange)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Article.count' do
      post articles_path, params: { article: { content: 'Lorem ipsum' } }
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'Article.count' do
      delete article_path(@article)
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy for wrong article' do
    log_in_as(users(:michael))
    article = articles(:zone)
    assert_no_difference 'Article.count' do
      delete article_path(article)
    end
    assert_redirected_to root_url
  end
end
