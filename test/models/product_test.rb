require "test_helper"

class ProductTest < ActiveSupport::TestCase

  test "Validate Name" do
    @product1 = Product.new(title: "", description: "malo", price: "1", user_id: 1 )
    assert_not @product1.save, "Save without name"
  end
  test "Validate description" do
    @product1 = Product.new(title: "name", description: "", price: "1", user_id: 1 )
    assert_not @product1.save, "Save without description"
  end 
  test "Validate Price" do
    @product1 = Product.new(title: "name", description: "malo", price: "", user_id: 1 )
    assert_not @product1.save, "Save without name"
  end 
  test "Validate User_id" do
    @product1 = Product.new(title: "name", description: "malo", price: "1", user_id: "" )
    assert_not @product1.save, "Save without name"
  end 


end
