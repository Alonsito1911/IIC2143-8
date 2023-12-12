require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  setup do
    @product1 = Product.new(title: "", description: "malo", price: "1", user_id: 1 )
  end 



  test "Validate creation with description" do
    @request = @product1.review.new(description: "laas")
    result = @request.save
    assert_not result, "Save without description"
  end
  
end
