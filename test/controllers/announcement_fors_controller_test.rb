require 'test_helper'

class AnnouncementForsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @announcement_for = announcement_fors(:one)
  end

  test "should get index" do
    get announcement_fors_url
    assert_response :success
  end

  test "should get new" do
    get new_announcement_for_url
    assert_response :success
  end

  test "should create announcement_for" do
    assert_difference('AnnouncementFor.count') do
      post announcement_fors_url, params: { announcement_for: { announcement_id: @announcement_for.announcement_id, franchisee_id: @announcement_for.franchisee_id } }
    end

    assert_redirected_to announcement_for_url(AnnouncementFor.last)
  end

  test "should show announcement_for" do
    get announcement_for_url(@announcement_for)
    assert_response :success
  end

  test "should get edit" do
    get edit_announcement_for_url(@announcement_for)
    assert_response :success
  end

  test "should update announcement_for" do
    patch announcement_for_url(@announcement_for), params: { announcement_for: { announcement_id: @announcement_for.announcement_id, franchisee_id: @announcement_for.franchisee_id } }
    assert_redirected_to announcement_for_url(@announcement_for)
  end

  test "should destroy announcement_for" do
    assert_difference('AnnouncementFor.count', -1) do
      delete announcement_for_url(@announcement_for)
    end

    assert_redirected_to announcement_fors_url
  end
end
