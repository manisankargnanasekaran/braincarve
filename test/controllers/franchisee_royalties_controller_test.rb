require 'test_helper'

class FranchiseeRoyaltiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @franchisee_royalty = franchisee_royalties(:one)
  end

  test "should get index" do
    get franchisee_royalties_url
    assert_response :success
  end

  test "should get new" do
    get new_franchisee_royalty_url
    assert_response :success
  end

  test "should create franchisee_royalty" do
    assert_difference('FranchiseeRoyalty.count') do
      post franchisee_royalties_url, params: { franchisee_royalty: { franchisee_id: @franchisee_royalty.franchisee_id, franchisee_royalty: @franchisee_royalty.franchisee_royalty, student_royalty: @franchisee_royalty.student_royalty, to_franchisee: @franchisee_royalty.to_franchisee } }
    end

    assert_redirected_to franchisee_royalty_url(FranchiseeRoyalty.last)
  end

  test "should show franchisee_royalty" do
    get franchisee_royalty_url(@franchisee_royalty)
    assert_response :success
  end

  test "should get edit" do
    get edit_franchisee_royalty_url(@franchisee_royalty)
    assert_response :success
  end

  test "should update franchisee_royalty" do
    patch franchisee_royalty_url(@franchisee_royalty), params: { franchisee_royalty: { franchisee_id: @franchisee_royalty.franchisee_id, franchisee_royalty: @franchisee_royalty.franchisee_royalty, student_royalty: @franchisee_royalty.student_royalty, to_franchisee: @franchisee_royalty.to_franchisee } }
    assert_redirected_to franchisee_royalty_url(@franchisee_royalty)
  end

  test "should destroy franchisee_royalty" do
    assert_difference('FranchiseeRoyalty.count', -1) do
      delete franchisee_royalty_url(@franchisee_royalty)
    end

    assert_redirected_to franchisee_royalties_url
  end
end
