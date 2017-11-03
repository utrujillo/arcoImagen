require 'test_helper'

class Admin::CatPlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_cat_place = admin_cat_places(:one)
  end

  test "should get index" do
    get admin_cat_places_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_cat_place_url
    assert_response :success
  end

  test "should create admin_cat_place" do
    assert_difference('Admin::CatPlace.count') do
      post admin_cat_places_url, params: { admin_cat_place: { nombre: @admin_cat_place.nombre } }
    end

    assert_redirected_to admin_cat_place_url(Admin::CatPlace.last)
  end

  test "should show admin_cat_place" do
    get admin_cat_place_url(@admin_cat_place)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_cat_place_url(@admin_cat_place)
    assert_response :success
  end

  test "should update admin_cat_place" do
    patch admin_cat_place_url(@admin_cat_place), params: { admin_cat_place: { nombre: @admin_cat_place.nombre } }
    assert_redirected_to admin_cat_place_url(@admin_cat_place)
  end

  test "should destroy admin_cat_place" do
    assert_difference('Admin::CatPlace.count', -1) do
      delete admin_cat_place_url(@admin_cat_place)
    end

    assert_redirected_to admin_cat_places_url
  end
end
