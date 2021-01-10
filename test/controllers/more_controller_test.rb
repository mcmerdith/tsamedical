require "test_helper"

class MoreControllerTest < ActionDispatch::IntegrationTest
  test "should get tsa" do
    get more_tsa_url
    assert_response :success
  end

  test "should get cte" do
    get more_cte_url
    assert_response :success
  end

  test "should get devs" do
    get more_devs_url
    assert_response :success
  end

  test "should get site" do
    get more_site_url
    assert_response :success
  end

  test "should get company" do
    get more_company_url
    assert_response :success
  end
end
