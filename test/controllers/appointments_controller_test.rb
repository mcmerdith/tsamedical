require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get my" do
    get appointments_my_url
    assert_response :success
  end

  test "should get schedule" do
    get appointments_schedule_url
    assert_response :success
  end

  test "should get cancel" do
    get appointments_cancel_url
    assert_response :success
  end
end
