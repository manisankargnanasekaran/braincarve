require 'test_helper'

class FranchiseeContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @franchisee_contact = franchisee_contacts(:one)
  end

  test "should get index" do
    get franchisee_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_franchisee_contact_url
    assert_response :success
  end

  test "should create franchisee_contact" do
    assert_difference('FranchiseeContact.count') do
      post franchisee_contacts_url, params: { franchisee_contact: { address: @franchisee_contact.address, city: @franchisee_contact.city, contact_no: @franchisee_contact.contact_no, country: @franchisee_contact.country, email_id: @franchisee_contact.email_id, franchisee_id: @franchisee_contact.franchisee_id, land_line: @franchisee_contact.land_line, state: @franchisee_contact.state } }
    end

    assert_redirected_to franchisee_contact_url(FranchiseeContact.last)
  end

  test "should show franchisee_contact" do
    get franchisee_contact_url(@franchisee_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_franchisee_contact_url(@franchisee_contact)
    assert_response :success
  end

  test "should update franchisee_contact" do
    patch franchisee_contact_url(@franchisee_contact), params: { franchisee_contact: { address: @franchisee_contact.address, city: @franchisee_contact.city, contact_no: @franchisee_contact.contact_no, country: @franchisee_contact.country, email_id: @franchisee_contact.email_id, franchisee_id: @franchisee_contact.franchisee_id, land_line: @franchisee_contact.land_line, state: @franchisee_contact.state } }
    assert_redirected_to franchisee_contact_url(@franchisee_contact)
  end

  test "should destroy franchisee_contact" do
    assert_difference('FranchiseeContact.count', -1) do
      delete franchisee_contact_url(@franchisee_contact)
    end

    assert_redirected_to franchisee_contacts_url
  end
end
