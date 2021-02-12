require 'test_helper'

class TestControllerTest < ActionDispatch::IntegrationTest
  test "should get problem" do
    get test_problem_url
    assert_response :success
  end

end
