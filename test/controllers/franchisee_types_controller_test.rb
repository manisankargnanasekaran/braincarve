require 'test_helper'

class FranchiseeTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @franchisee_type = franchisee_types(:one)
  end

  test "should get index" do
    get franchisee_types_url
    assert_response :success
  end

  test "should get new" do
    get new_franchisee_type_url
    assert_response :success
  end

  test "should create franchisee_type" do
    assert_difference('FranchiseeType.count') do
      post franchisee_types_url, params: { franchisee_type: { description: @franchisee_type.description, type_name: @franchisee_type.type_name } }
    end

    assert_redirected_to franchisee_type_url(FranchiseeType.last)
  end

  test "should show franchisee_type" do
    get franchisee_type_url(@franchisee_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_franchisee_type_url(@franchisee_type)
    assert_response :success
  end

  test "should update franchisee_type" do
    patch franchisee_type_url(@franchisee_type), params: { franchisee_type: { description: @franchisee_type.description, type_name: @franchisee_type.type_name } }
    assert_redirected_to franchisee_type_url(@franchisee_type)
  end

  test "should destroy franchisee_type" do
    assert_difference('FranchiseeType.count', -1) do
      delete franchisee_type_url(@franchisee_type)
    end

    assert_redirected_to franchisee_types_url
  end
end
