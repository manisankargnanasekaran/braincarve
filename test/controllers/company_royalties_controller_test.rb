require 'test_helper'

class CompanyRoyaltiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_royalty = company_royalties(:one)
  end

  test "should get index" do
    get company_royalties_url
    assert_response :success
  end

  test "should get new" do
    get new_company_royalty_url
    assert_response :success
  end

  test "should create company_royalty" do
    assert_difference('CompanyRoyalty.count') do
      post company_royalties_url, params: { company_royalty: { franchisee_id: @company_royalty.franchisee_id, franchisee_royalty: @company_royalty.franchisee_royalty, student_royalty: @company_royalty.student_royalty } }
    end

    assert_redirected_to company_royalty_url(CompanyRoyalty.last)
  end

  test "should show company_royalty" do
    get company_royalty_url(@company_royalty)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_royalty_url(@company_royalty)
    assert_response :success
  end

  test "should update company_royalty" do
    patch company_royalty_url(@company_royalty), params: { company_royalty: { franchisee_id: @company_royalty.franchisee_id, franchisee_royalty: @company_royalty.franchisee_royalty, student_royalty: @company_royalty.student_royalty } }
    assert_redirected_to company_royalty_url(@company_royalty)
  end

  test "should destroy company_royalty" do
    assert_difference('CompanyRoyalty.count', -1) do
      delete company_royalty_url(@company_royalty)
    end

    assert_redirected_to company_royalties_url
  end
end
