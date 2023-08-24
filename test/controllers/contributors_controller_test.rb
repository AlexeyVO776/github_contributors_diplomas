require "test_helper"

class ContributorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contributors_index_url
    assert_response :success
  end

  test "should get fetch" do
    get contributors_fetch_url
    assert_response :success
  end
end
