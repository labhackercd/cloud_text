require 'test_helper'

class TextImportsControllerTest < ActionController::TestCase
  setup do
    @text_import = text_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:text_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create text_import" do
    assert_difference('TextImport.count') do
      post :create, text_import: { text: @text_import.text }
    end

    assert_redirected_to text_import_path(assigns(:text_import))
  end

  test "should show text_import" do
    get :show, id: @text_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @text_import
    assert_response :success
  end

  test "should update text_import" do
    patch :update, id: @text_import, text_import: { text: @text_import.text }
    assert_redirected_to text_import_path(assigns(:text_import))
  end

  test "should destroy text_import" do
    assert_difference('TextImport.count', -1) do
      delete :destroy, id: @text_import
    end

    assert_redirected_to text_imports_path
  end
end
