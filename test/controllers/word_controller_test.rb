require 'test_helper'

class WordControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get word_name_url
    assert_response :success
  end

end
