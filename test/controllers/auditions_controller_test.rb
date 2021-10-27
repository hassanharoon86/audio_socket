require "test_helper"

class AuditionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get auditions_new_url
    assert_response :success
  end

  test "should get create" do
    get auditions_create_url
    assert_response :success
  end
end
