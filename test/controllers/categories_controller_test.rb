require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def current_user
    @current_user
  end

  setup do
    sign_in users(:paco)

    @user = users(:paco)
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference("Category.count") do
      post create_category_url, params: { category: { tipo: @category } }
    end

    assert_redirected_to products_url
  end




end