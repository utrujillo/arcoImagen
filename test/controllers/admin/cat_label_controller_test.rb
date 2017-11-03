require 'test_helper'

class Admin::CatLabelControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_cat_label_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_cat_label_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_cat_label_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_cat_label_show_url
    assert_response :success
  end

end
