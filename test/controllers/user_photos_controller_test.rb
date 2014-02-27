require 'test_helper'

class UserPhotosControllerTest < ActionController::TestCase
  setup do
    @user_photo = user_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_photo" do
    assert_difference('UserPhoto.count') do
      post :create, user_photo: { comment: @user_photo.comment, content_type: @user_photo.content_type, title: @user_photo.title, user_id: @user_photo.user_id }
    end

    assert_redirected_to user_photo_path(assigns(:user_photo))
  end

  test "should show user_photo" do
    get :show, id: @user_photo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_photo
    assert_response :success
  end

  test "should update user_photo" do
    patch :update, id: @user_photo, user_photo: { comment: @user_photo.comment, content_type: @user_photo.content_type, title: @user_photo.title, user_id: @user_photo.user_id }
    assert_redirected_to user_photo_path(assigns(:user_photo))
  end

  test "should destroy user_photo" do
    assert_difference('UserPhoto.count', -1) do
      delete :destroy, id: @user_photo
    end

    assert_redirected_to user_photos_path
  end
end
