# frozen_string_literal: true

require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test 'unsuccessful edit' do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    invalid_user = {
      name: '',
      email: 'foo@invalid',
      password: 'foo',
      password_confirmation: 'bar'
    }
    patch user_path(@user), params: { user: invalid_user }
    assert_template 'users/edit'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors', count: 4 * 2 # label and input
  end

  test 'successful edit with friendly forwarding' do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name = 'Foo Bar'
    email = 'foo@bar.com'
    new_user = {
      name: name,
      email: email,
      password: '',
      password_confirmation: ''
    }
    patch user_path(@user), params: { user: new_user }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
