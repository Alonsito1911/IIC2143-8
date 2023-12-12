require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  def current_user
    @current_user
  end

  setup do
    sign_in users(:paco)

    @user = users(:paco)
  end

  test "renderizar la lista de productos" do # verificar que se rendericen los productos en la pagina de iniico
    get "/products"

    assert_response :success
    assert_select '.product', 2
  end

  test "renderizar show de productos" do
    get product_path(products(:one))
    assert_response :success
    assert '.title', 'NOKIA'
    assert '.description', 'duro de matar'
    assert 'price', '150$'

  end


  test 'render a new product form' do

    get new_product_path

    assert_response :success
    assert_select 'form'
  end


  test 'allows to create a new product' do
    post create_product_path, params: {
      product: {
        title: 'Nintendo 64',
        description: 'Le faltan los cables',
        price: 45,
        category_id: categories(:pizza).id
      }
    }

    assert_redirected_to products_path

  end

  test 'does not allow to create a new product with empty fields' do
    post products_path, params: {
      product: {
        title: '',
        description: 'Le faltan los cables',
        price: 45
      }
    }

    assert_response :unprocessable_entity
  end

  test 'render an edit product form' do
    get edit_product_path(products(:one))

    assert_response :success
    assert_select 'form'
  end

  test 'allows to update a product' do
    patch update_product_path(products(:one)), params: {product: {title:"a",description: "aaa", price: 1}}

    #assert_response :success#no se que er

  end

  test 'does not allow to update a product with an invalid field' do
    patch product_path(products(:one)), params: {
      product: {
        price: nil
      }
    }

    assert_response :unprocessable_entity
  end

  test 'can delete products' do
    
    delete destroy_product_path(products(:one))
    

    assert_redirected_to products_path
   
  end


  #test "renderizar el show del p."
end
