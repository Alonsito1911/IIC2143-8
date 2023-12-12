require "test_helper"

class RequestTest < ActiveSupport::TestCase

  setup do
    @product1 = Product.new(title: "", description: "malo", price: "1", user_id: 1 )
  end 



  test "Validate creation with email" do
    @request = @product1.request.new(email: "", adress: "laas", amount: 1)
    result = @request.save
    assert_not result, "Save without email"
  end
  test "Validate creation with adress" do
    @request = @product1.request.new(email: "a@uc.cl", adress: "", amount: 1)
    result = @request.save
    assert_not result, "Save without adress"
  end

  test "Validate creation with amount" do
    @request = @product1.request.new(email: "", adress: "laas", amount: "")
    result = @request.save
    assert_not result, "Save without amount"
  end
  

  
  

end
