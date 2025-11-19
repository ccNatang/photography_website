require "test_helper"

class GalleriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get galleries_url
    assert_response :success
  end

  test "should get show" do
    gallery = galleries(:one)
    get gallery_url(gallery)
    assert_response :success
  end
end
