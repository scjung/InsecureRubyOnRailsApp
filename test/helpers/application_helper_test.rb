# frozen_string_literal: true

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'full title helper' do
    assert_equal full_title, 'Deliberately Insecure Ruby on Rails Application'
    assert_equal full_title('User'),
                 'User | Deliberately Insecure Ruby on Rails Application'
  end
end
