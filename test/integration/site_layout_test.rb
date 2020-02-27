# frozen_string_literal: true

require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test 'layout links' do
    get root_path
    assert_template 'welcome/index'
    assert_select 'a[href=?]', root_path, 2
    assert_select 'title', full_title

    get signup_path
    assert_select 'title', full_title('Sign up')
  end
end
