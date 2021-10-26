require "test_helper"

class ArtistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get artist_index_url
    assert_response :success
  end
end
