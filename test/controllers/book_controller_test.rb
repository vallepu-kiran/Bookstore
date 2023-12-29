require "test_helper"

class BookControllerTest < ActionDispatch::IntegrationTest
  test "should get Orders" do
    get book_Orders_url
    assert_response :success
  end
end
