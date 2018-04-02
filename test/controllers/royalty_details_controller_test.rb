require 'test_helper'

class RoyaltyDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @royalty_detail = royalty_details(:one)
  end

  test "should get index" do
    get royalty_details_url
    assert_response :success
  end

  test "should get new" do
    get new_royalty_detail_url
    assert_response :success
  end

  test "should create royalty_detail" do
    assert_difference('RoyaltyDetail.count') do
      post royalty_details_url, params: { royalty_detail: { amount: @royalty_detail.amount, franchisee_id: @royalty_detail.franchisee_id, royalty_type: @royalty_detail.royalty_type, to_franchisee: @royalty_detail.to_franchisee } }
    end

    assert_redirected_to royalty_detail_url(RoyaltyDetail.last)
  end

  test "should show royalty_detail" do
    get royalty_detail_url(@royalty_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_royalty_detail_url(@royalty_detail)
    assert_response :success
  end

  test "should update royalty_detail" do
    patch royalty_detail_url(@royalty_detail), params: { royalty_detail: { amount: @royalty_detail.amount, franchisee_id: @royalty_detail.franchisee_id, royalty_type: @royalty_detail.royalty_type, to_franchisee: @royalty_detail.to_franchisee } }
    assert_redirected_to royalty_detail_url(@royalty_detail)
  end

  test "should destroy royalty_detail" do
    assert_difference('RoyaltyDetail.count', -1) do
      delete royalty_detail_url(@royalty_detail)
    end

    assert_redirected_to royalty_details_url
  end
end
