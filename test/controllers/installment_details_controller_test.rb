require 'test_helper'

class InstallmentDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @installment_detail = installment_details(:one)
  end

  test "should get index" do
    get installment_details_url
    assert_response :success
  end

  test "should get new" do
    get new_installment_detail_url
    assert_response :success
  end

  test "should create installment_detail" do
    assert_difference('InstallmentDetail.count') do
      post installment_details_url, params: { installment_detail: { franchisee_id: @installment_detail.franchisee_id, installment_amount: @installment_detail.installment_amount, installment_date: @installment_detail.installment_date } }
    end

    assert_redirected_to installment_detail_url(InstallmentDetail.last)
  end

  test "should show installment_detail" do
    get installment_detail_url(@installment_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_installment_detail_url(@installment_detail)
    assert_response :success
  end

  test "should update installment_detail" do
    patch installment_detail_url(@installment_detail), params: { installment_detail: { franchisee_id: @installment_detail.franchisee_id, installment_amount: @installment_detail.installment_amount, installment_date: @installment_detail.installment_date } }
    assert_redirected_to installment_detail_url(@installment_detail)
  end

  test "should destroy installment_detail" do
    assert_difference('InstallmentDetail.count', -1) do
      delete installment_detail_url(@installment_detail)
    end

    assert_redirected_to installment_details_url
  end
end
