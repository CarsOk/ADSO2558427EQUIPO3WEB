require 'test_helper'

class BreadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get breads_index_url
    assert_response :success
  end

  test "should get show" do
    get breads_show_url
    assert_response :success
  end

  test "should get new" do
    get breads_new_url
    assert_response :success
  end

  test "should get edit" do
    get breads_edit_url
    assert_response :success
  end

  test "should get create" do
    get breads_create_url
    assert_response :success
  end

  test "should get update" do
    get breads_update_url
    assert_response :success
  end

  test "should get destroy" do
    get breads_destroy_url
    assert_response :success
  end

end
