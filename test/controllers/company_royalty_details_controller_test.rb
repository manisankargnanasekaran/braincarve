require 'test_helper'

class CompanyRoyaltyDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_royalty_detail = company_royalty_details(:one)
  end

  test "should get index" do
    get company_royalty_details_url
    assert_response :success
  end

  test "should get new" do
    get new_company_royalty_detail_url
    assert_response :success
  end

  test "should create company_royalty_detail" do
    assert_difference('CompanyRoyaltyDetail.count') do
      post company_royalty_details_url, params: { company_royalty_detail: { amount: @company_royalty_detail.amount, franchisee_id: @company_royalty_detail.franchisee_id, royalty_type: @company_royalty_detail.royalty_type } }
    end

    assert_redirected_to company_royalty_detail_url(CompanyRoyaltyDetail.last)
  end

  test "should show company_royalty_detail" do
    get company_royalty_detail_url(@company_royalty_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_royalty_detail_url(@company_royalty_detail)
    assert_response :success
  end

  test "should update company_royalty_detail" do
    patch company_royalty_detail_url(@company_royalty_detail), params: { company_royalty_detail: { amount: @company_royalty_detail.amount, franchisee_id: @company_royalty_detail.franchisee_id, royalty_type: @company_royalty_detail.royalty_type } }
    assert_redirected_to company_royalty_detail_url(@company_royalty_detail)
  end

  test "should destroy company_royalty_detail" do
    assert_difference('CompanyRoyaltyDetail.count', -1) do
      delete company_royalty_detail_url(@company_royalty_detail)
    end

    assert_redirected_to company_royalty_details_url
  end
end
