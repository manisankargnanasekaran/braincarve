require 'test_helper'

class FranchiseePersonalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @franchisee_personal = franchisee_personals(:one)
  end

  test "should get index" do
    get franchisee_personals_url
    assert_response :success
  end

  test "should get new" do
    get new_franchisee_personal_url
    assert_response :success
  end

  test "should create franchisee_personal" do
    assert_difference('FranchiseePersonal.count') do
      post franchisee_personals_url, params: { franchisee_personal: { age: @franchisee_personal.age, dob: @franchisee_personal.dob, experience: @franchisee_personal.experience, first_name: @franchisee_personal.first_name, franchisee_id: @franchisee_personal.franchisee_id, last_name: @franchisee_personal.last_name, middle_name: @franchisee_personal.middle_name, no_of_owners: @franchisee_personal.no_of_owners, occupation: @franchisee_personal.occupation } }
    end

    assert_redirected_to franchisee_personal_url(FranchiseePersonal.last)
  end

  test "should show franchisee_personal" do
    get franchisee_personal_url(@franchisee_personal)
    assert_response :success
  end

  test "should get edit" do
    get edit_franchisee_personal_url(@franchisee_personal)
    assert_response :success
  end

  test "should update franchisee_personal" do
    patch franchisee_personal_url(@franchisee_personal), params: { franchisee_personal: { age: @franchisee_personal.age, dob: @franchisee_personal.dob, experience: @franchisee_personal.experience, first_name: @franchisee_personal.first_name, franchisee_id: @franchisee_personal.franchisee_id, last_name: @franchisee_personal.last_name, middle_name: @franchisee_personal.middle_name, no_of_owners: @franchisee_personal.no_of_owners, occupation: @franchisee_personal.occupation } }
    assert_redirected_to franchisee_personal_url(@franchisee_personal)
  end

  test "should destroy franchisee_personal" do
    assert_difference('FranchiseePersonal.count', -1) do
      delete franchisee_personal_url(@franchisee_personal)
    end

    assert_redirected_to franchisee_personals_url
  end
end
