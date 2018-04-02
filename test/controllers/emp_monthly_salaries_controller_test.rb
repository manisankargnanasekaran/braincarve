require 'test_helper'

class EmpMonthlySalariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emp_monthly_salary = emp_monthly_salaries(:one)
  end

  test "should get index" do
    get emp_monthly_salaries_url
    assert_response :success
  end

  test "should get new" do
    get new_emp_monthly_salary_url
    assert_response :success
  end

  test "should create emp_monthly_salary" do
    assert_difference('EmpMonthlySalary.count') do
      post emp_monthly_salaries_url, params: { emp_monthly_salary: { employee_id: @emp_monthly_salary.employee_id, net_salary: @emp_monthly_salary.net_salary, no_of_leave: @emp_monthly_salary.no_of_leave, salary_for: @emp_monthly_salary.salary_for } }
    end

    assert_redirected_to emp_monthly_salary_url(EmpMonthlySalary.last)
  end

  test "should show emp_monthly_salary" do
    get emp_monthly_salary_url(@emp_monthly_salary)
    assert_response :success
  end

  test "should get edit" do
    get edit_emp_monthly_salary_url(@emp_monthly_salary)
    assert_response :success
  end

  test "should update emp_monthly_salary" do
    patch emp_monthly_salary_url(@emp_monthly_salary), params: { emp_monthly_salary: { employee_id: @emp_monthly_salary.employee_id, net_salary: @emp_monthly_salary.net_salary, no_of_leave: @emp_monthly_salary.no_of_leave, salary_for: @emp_monthly_salary.salary_for } }
    assert_redirected_to emp_monthly_salary_url(@emp_monthly_salary)
  end

  test "should destroy emp_monthly_salary" do
    assert_difference('EmpMonthlySalary.count', -1) do
      delete emp_monthly_salary_url(@emp_monthly_salary)
    end

    assert_redirected_to emp_monthly_salaries_url
  end
end
