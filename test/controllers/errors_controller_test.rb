require "test_helper"

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should get server" do
    get errors_server_url
    assert_response :success
  end

  test "should get request" do
    get errors_request_url
    assert_response :success
  end

  test "should get unauthorized" do
    get errors_unauthorized_url
    assert_response :success
  end

  test "should get forbidden" do
    get errors_forbidden_url
    assert_response :success
  end

  test "should get notfound" do
    get errors_notfound_url
    assert_response :success
  end

  test "should get unnacceptable" do
    get errors_unnacceptable_url
    assert_response :success
  end
end
