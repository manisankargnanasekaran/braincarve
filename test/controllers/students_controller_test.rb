require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post students_url, params: { student: { address: @student.address, age: @student.age, contact_no: @student.contact_no, dob: @student.dob, gender: @student.gender, registration_date: @student.registration_date, school_location: @student.school_location, school_name: @student.school_name, student_class: @student.student_class, student_name: @student.student_name } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { address: @student.address, age: @student.age, contact_no: @student.contact_no, dob: @student.dob, gender: @student.gender, registration_date: @student.registration_date, school_location: @student.school_location, school_name: @student.school_name, student_class: @student.student_class, student_name: @student.student_name } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
