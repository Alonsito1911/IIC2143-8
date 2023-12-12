require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "Validate Name" do
    @user = User.new(name: "", description: "malo", telefono: "1", email: "a@uc.cl")
    assert_not @user.save, "Save without name"
  end
  test "Validate description" do
    @user = User.new(name: "name", description: "", telefono: "1", email: "a@uc.cl")
    assert_not @user.save, "Save without description"
  end 
  test "Validate Telefono" do
    @user = User.new(name: "name", description: "malo", telefono: "", email: "a@uc.cl")
    assert_not @user.save, "Save without name"
  end 
  test "Validate email" do
    @user = User.new(name: "name", description: "malo", telefono: "1", email: "")
    assert_not @user.save, "Save without name"
  end 
end
