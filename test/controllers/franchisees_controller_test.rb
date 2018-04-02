require 'test_helper'

class FranchiseesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @franchisee = franchisees(:one)
  end

  test "should get index" do
    get franchisees_url
    assert_response :success
  end

  test "should get new" do
    get new_franchisee_url
    assert_response :success
  end

  test "should create franchisee" do
    assert_difference('Franchisee.count') do
      post franchisees_url, params: { franchisee: { franchisee_type_id: @franchisee.franchisee_type_id, location: @franchisee.location, parent_id: @franchisee.parent_id } }
    end

    assert_redirected_to franchisee_url(Franchisee.last)
  end

  test "should show franchisee" do
    get franchisee_url(@franchisee)
    assert_response :success
  end

  test "should get edit" do
    get edit_franchisee_url(@franchisee)
    assert_response :success
  end

  test "should update franchisee" do
    patch franchisee_url(@franchisee), params: { franchisee: { franchisee_type_id: @franchisee.franchisee_type_id, location: @franchisee.location, parent_id: @franchisee.parent_id } }
    assert_redirected_to franchisee_url(@franchisee)
  end

  test "should destroy franchisee" do
    assert_difference('Franchisee.count', -1) do
      delete franchisee_url(@franchisee)
    end

    assert_redirected_to franchisees_url
  end
end
