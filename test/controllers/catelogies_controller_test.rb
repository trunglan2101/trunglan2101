require "test_helper"

class CatelogiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get catelogies_show_url
    assert_response :success
  end

  test "should get index" do
    get catelogies_index_url
    assert_response :success
  end

  test "should get new" do
    get catelogies_new_url
    assert_response :success
  end

  test "should get edit" do
    get catelogies_edit_url
    assert_response :success
  end

  test "should get create" do
    get catelogies_create_url
    assert_response :success
  end

  test "should get update" do
    get catelogies_update_url
    assert_response :success
  end

  test "should get destroy" do
    get catelogies_destroy_url
    assert_response :success
  end
end
