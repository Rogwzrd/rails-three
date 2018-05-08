require 'test_helper'

class ApplictionHelperTest < ActionView::TestCase
    test 'full title helper' do
        assert_equal full_title, "Ruby on Rails Tutorials Sample App"
        assert_equal full_title('Help'), "Help | Ruby on Rails Tutorials Sample App"
    end
end