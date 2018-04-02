require 'test_helper'

class FranchiseeAgreementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @franchisee_agreement = franchisee_agreements(:one)
  end

  test "should get index" do
    get franchisee_agreements_url
    assert_response :success
  end

  test "should get new" do
    get new_franchisee_agreement_url
    assert_response :success
  end

  test "should create franchisee_agreement" do
    assert_difference('FranchiseeAgreement.count') do
      post franchisee_agreements_url, params: { franchisee_agreement: { advance_amount_gst: @franchisee_agreement.advance_amount_gst, agreement_date: @franchisee_agreement.agreement_date, balance_amount_gst: @franchisee_agreement.balance_amount_gst, center_address: @franchisee_agreement.center_address, city: @franchisee_agreement.city, duration: @franchisee_agreement.duration, franchisee_id: @franchisee_agreement.franchisee_id, location: @franchisee_agreement.location, no_of_centers: @franchisee_agreement.no_of_centers, no_of_installment: @franchisee_agreement.no_of_installment, pincode: @franchisee_agreement.pincode, renewal_date: @franchisee_agreement.renewal_date, state: @franchisee_agreement.state } }
    end

    assert_redirected_to franchisee_agreement_url(FranchiseeAgreement.last)
  end

  test "should show franchisee_agreement" do
    get franchisee_agreement_url(@franchisee_agreement)
    assert_response :success
  end

  test "should get edit" do
    get edit_franchisee_agreement_url(@franchisee_agreement)
    assert_response :success
  end

  test "should update franchisee_agreement" do
    patch franchisee_agreement_url(@franchisee_agreement), params: { franchisee_agreement: { advance_amount_gst: @franchisee_agreement.advance_amount_gst, agreement_date: @franchisee_agreement.agreement_date, balance_amount_gst: @franchisee_agreement.balance_amount_gst, center_address: @franchisee_agreement.center_address, city: @franchisee_agreement.city, duration: @franchisee_agreement.duration, franchisee_id: @franchisee_agreement.franchisee_id, location: @franchisee_agreement.location, no_of_centers: @franchisee_agreement.no_of_centers, no_of_installment: @franchisee_agreement.no_of_installment, pincode: @franchisee_agreement.pincode, renewal_date: @franchisee_agreement.renewal_date, state: @franchisee_agreement.state } }
    assert_redirected_to franchisee_agreement_url(@franchisee_agreement)
  end

  test "should destroy franchisee_agreement" do
    assert_difference('FranchiseeAgreement.count', -1) do
      delete franchisee_agreement_url(@franchisee_agreement)
    end

    assert_redirected_to franchisee_agreements_url
  end
end
