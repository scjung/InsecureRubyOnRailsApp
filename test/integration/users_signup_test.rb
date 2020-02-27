# frozen_string_literal: true

require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
  end

  test 'invalid signup information' do
    get signup_path
    assert_no_difference 'User.count' do
      invalid_user = { name: '',
                       email: 'user@invalid',
                       password: 'foo',
                       password_confirmation: 'bar' }
      post users_path, params: { user: invalid_user }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors', count: 4 * 2 # label and input
  end

  test 'valid signup information with account activation' do
    get signup_path
    assert_difference 'User.count', 1 do
      user = { name: 'Example User',
               email: 'user@example.com',
               password: 'password',
               password_confirmation: 'password' }
      post users_path, params: { user: user }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    log_in_as(user)
    assert_not logged_in?
    get edit_account_activation_path('invalid token', email: user.email)
    assert_not logged_in?
    get edit_account_activation_path(user.activation_token, email: 'wrong')
    assert_not logged_in?
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert logged_in?
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
    assert logged_in?
  end
end
