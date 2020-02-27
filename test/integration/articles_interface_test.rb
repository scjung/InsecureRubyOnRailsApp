# frozen_string_literal: true

require 'test_helper'

class ArticlesInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test 'article interface' do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    assert_select 'input[type=file]'
    # invalid submission
    assert_no_difference 'Article.count' do
      post articles_path, params: { article: { content: '' } }
    end
    assert_select '#error_explanation'
    assert_select 'a[href=?]', '/?page=2'
    # valid submission
    content = 'It is valid content.'
    image = fixture_file_upload('test/fixtures/kitten.jpg', 'image/jpg')
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { content: content,
                                               images: [image] } }
    end
    assert assigns(:article).images.attached?
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # delete article
    assert_select 'a', text: 'delete'
    first_article = @user.articles.paginate(page: 1).first
    assert_difference 'Article.count', -1 do
      delete article_path(first_article)
    end
    # visit different user (no delete links)
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end

  test 'article sidebar count' do
    log_in_as(@user)
    get root_path
    assert_match "#{@user.articles.count} articles", response.body
    # user with zero articles
    other_user = users(:user_1)
    log_in_as(other_user)
    get root_path
    assert_match '0 articles', response.body
    other_user.articles.create!(content: 'An article')
    get root_path
    assert_match '1 article', response.body
  end
end
