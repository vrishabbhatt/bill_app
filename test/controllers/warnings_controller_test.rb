require 'test_helper'

class WarningsControllerTest < ActionController::TestCase
  test "should get unathorised_warning" do
    get :unathorised_warning
    assert_response :success
  end

end
