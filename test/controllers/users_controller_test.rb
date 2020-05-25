require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get Books" do
    get users_Books_url
    assert_response :success
  end

end
