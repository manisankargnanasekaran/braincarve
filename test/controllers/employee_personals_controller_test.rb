require 'test_helper'

class EmployeePersonalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_personal = employee_personals(:one)
  end

  test "should get index" do
    get employee_personals_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_personal_url
    assert_response :success
  end

  test "should create employee_personal" do
    assert_difference('EmployeePersonal.count') do
      post employee_personals_url, params: { employee_personal: { blood_group: @employee_personal.blood_group, date_of_birth: @employee_personal.date_of_birth, employee_id: @employee_personal.employee_id, gender: @employee_personal.gender, marrital_status: @employee_personal.marrital_status, nationality: @employee_personal.nationality } }
    end

    assert_redirected_to employee_personal_url(EmployeePersonal.last)
  end

  test "should show employee_personal" do
    get employee_personal_url(@employee_personal)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_personal_url(@employee_personal)
    assert_response :success
  end

  test "should update employee_personal" do
    patch employee_personal_url(@employee_personal), params: { employee_personal: { blood_group: @employee_personal.blood_group, date_of_birth: @employee_personal.date_of_birth, employee_id: @employee_personal.employee_id, gender: @employee_personal.gender, marrital_status: @employee_personal.marrital_status, nationality: @employee_personal.nationality } }
    assert_redirected_to employee_personal_url(@employee_personal)
  end

  test "should destroy employee_personal" do
    assert_difference('EmployeePersonal.count', -1) do
      delete employee_personal_url(@employee_personal)
    end

    assert_redirected_to employee_personals_url
  end
end
