require 'test_helper'

class TraysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trays_index_url
    assert_response :success
  end

  test "should get show" do
    get trays_show_url
    assert_response :success
  end

  test "should get new" do
    get trays_new_url
    assert_response :success
  end

  test "should get edit" do
    get trays_edit_url
    assert_response :success
  end

  test "should get create" do
    get trays_create_url
    assert_response :success
  end

  test "should get update" do
    get trays_update_url
    assert_response :success
  end

  test "should get destroy" do
    get trays_destroy_url
    assert_response :success
  end

end
