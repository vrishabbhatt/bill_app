require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get sample_page" do
    get :sample_page
    assert_response :success
  end

end
