require 'test_helper'

class EmployeeContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_contact = employee_contacts(:one)
  end

  test "should get index" do
    get employee_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_contact_url
    assert_response :success
  end

  test "should create employee_contact" do
    assert_difference('EmployeeContact.count') do
      post employee_contacts_url, params: { employee_contact: { address: @employee_contact.address, city: @employee_contact.city, contact_no: @employee_contact.contact_no, country: @employee_contact.country, employee_id: @employee_contact.employee_id, pincode: @employee_contact.pincode, state: @employee_contact.state } }
    end

    assert_redirected_to employee_contact_url(EmployeeContact.last)
  end

  test "should show employee_contact" do
    get employee_contact_url(@employee_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_contact_url(@employee_contact)
    assert_response :success
  end

  test "should update employee_contact" do
    patch employee_contact_url(@employee_contact), params: { employee_contact: { address: @employee_contact.address, city: @employee_contact.city, contact_no: @employee_contact.contact_no, country: @employee_contact.country, employee_id: @employee_contact.employee_id, pincode: @employee_contact.pincode, state: @employee_contact.state } }
    assert_redirected_to employee_contact_url(@employee_contact)
  end

  test "should destroy employee_contact" do
    assert_difference('EmployeeContact.count', -1) do
      delete employee_contact_url(@employee_contact)
    end

    assert_redirected_to employee_contacts_url
  end
end
