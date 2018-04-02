require 'test_helper'

class EmployeeAttendancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_attendance = employee_attendances(:one)
  end

  test "should get index" do
    get employee_attendances_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_attendance_url
    assert_response :success
  end

  test "should create employee_attendance" do
    assert_difference('EmployeeAttendance.count') do
      post employee_attendances_url, params: { employee_attendance: { day_count: @employee_attendance.day_count, employee_id: @employee_attendance.employee_id, leave_period: @employee_attendance.leave_period, reason: @employee_attendance.reason } }
    end

    assert_redirected_to employee_attendance_url(EmployeeAttendance.last)
  end

  test "should show employee_attendance" do
    get employee_attendance_url(@employee_attendance)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_attendance_url(@employee_attendance)
    assert_response :success
  end

  test "should update employee_attendance" do
    patch employee_attendance_url(@employee_attendance), params: { employee_attendance: { day_count: @employee_attendance.day_count, employee_id: @employee_attendance.employee_id, leave_period: @employee_attendance.leave_period, reason: @employee_attendance.reason } }
    assert_redirected_to employee_attendance_url(@employee_attendance)
  end

  test "should destroy employee_attendance" do
    assert_difference('EmployeeAttendance.count', -1) do
      delete employee_attendance_url(@employee_attendance)
    end

    assert_redirected_to employee_attendances_url
  end
end
