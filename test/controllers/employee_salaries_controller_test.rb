require 'test_helper'

class EmployeeSalariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_salary = employee_salaries(:one)
  end

  test "should get index" do
    get employee_salaries_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_salary_url
    assert_response :success
  end

  test "should create employee_salary" do
    assert_difference('EmployeeSalary.count') do
      post employee_salaries_url, params: { employee_salary: { account_holder_name: @employee_salary.account_holder_name, account_number: @employee_salary.account_number, account_type: @employee_salary.account_type, bank_name: @employee_salary.bank_name, employee_id: @employee_salary.employee_id, ifsc_code: @employee_salary.ifsc_code, salary_amount: @employee_salary.salary_amount } }
    end

    assert_redirected_to employee_salary_url(EmployeeSalary.last)
  end

  test "should show employee_salary" do
    get employee_salary_url(@employee_salary)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_salary_url(@employee_salary)
    assert_response :success
  end

  test "should update employee_salary" do
    patch employee_salary_url(@employee_salary), params: { employee_salary: { account_holder_name: @employee_salary.account_holder_name, account_number: @employee_salary.account_number, account_type: @employee_salary.account_type, bank_name: @employee_salary.bank_name, employee_id: @employee_salary.employee_id, ifsc_code: @employee_salary.ifsc_code, salary_amount: @employee_salary.salary_amount } }
    assert_redirected_to employee_salary_url(@employee_salary)
  end

  test "should destroy employee_salary" do
    assert_difference('EmployeeSalary.count', -1) do
      delete employee_salary_url(@employee_salary)
    end

    assert_redirected_to employee_salaries_url
  end
end
