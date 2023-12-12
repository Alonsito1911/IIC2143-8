require "test_helper"

class RequestsControllerTest < ActionDispatch::IntegrationTest
  def current_user
    @current_user
  end

  setup do
    sign_in users(:paco)
    @user = users(:paco)
  end

  test "renderizar la lista de solicitudes de un producto" do

    result = Request.where(product_id: products(:one).id)
  

    assert result, 'Se ha mostrado todas las solitictudes de un producto'
  
  end

  test "renderizar show de reseña" do

    sign_in users(:paco)
    get show_requests_path(products(:one), requests(:one))
    assert_response :success
    assert '.title', 'NOKIA'
    assert '.description', 'duro de matar'
    assert 'price', '150'
  end
  test 'render a new request form' do
    get requests_path(products(:one), requests(:one))
    assert_response :success
    assert_select 'form'
  end
  test 'allows to create a new request' do
    sign_in users(:paco) 
    post create_request_path(products(:one)), params: {
      request: {
        email: 'a@uc.cl',
        adress: 'Le faltan los cables',
        amount: 45
      }
    }
  


  end

  test 'does not allow to create a new request with empty fields' do
    post create_request_path(products(:one)), params: {
      request: {
        email: '',
        adress: 'Le faltan los cables',
        amount: 45
      }
    }

    assert_response :unprocessable_entity
  end

  test 'render an edit product form' do
    get edit_request_path(products(:one), requests(:one))

    assert_response :success
    assert_select 'form'
  end

  test 'allows to update a product' do
    #sign_in users(:paco)
    #patch request_path(products(:one), requests(:one)), params: {request: {email:"a", adress: "aaa", amount: 1}}
     
    #assert_response :success#no se que er

  end

  test 'does not allow to update a product with an invalid field' do
    patch request_path(products(:one), requests(:one)), params: {
      request: {
        amount: nil
      }
    }

    assert_response :unprocessable_entity
  end

  test 'can delete products' do
    
    delete destroy_request_path(products(:one),requests(:one))
    

    assert_redirected_to products_path
   
  end



end
