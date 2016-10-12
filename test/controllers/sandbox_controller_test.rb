require 'test_helper'

class SandboxControllerTest < ActionController::TestCase
  test "should get teams" do
    get :teams
    assert_response :success
  end

end
