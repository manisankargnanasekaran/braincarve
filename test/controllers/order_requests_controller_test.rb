require 'test_helper'

class OrderRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_request = order_requests(:one)
  end

  test "should get index" do
    get order_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_order_request_url
    assert_response :success
  end

  test "should create order_request" do
    assert_difference('OrderRequest.count') do
      post order_requests_url, params: { order_request: { franchisee_id: @order_request.franchisee_id, order_date: @order_request.order_date } }
    end

    assert_redirected_to order_request_url(OrderRequest.last)
  end

  test "should show order_request" do
    get order_request_url(@order_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_request_url(@order_request)
    assert_response :success
  end

  test "should update order_request" do
    patch order_request_url(@order_request), params: { order_request: { franchisee_id: @order_request.franchisee_id, order_date: @order_request.order_date } }
    assert_redirected_to order_request_url(@order_request)
  end

  test "should destroy order_request" do
    assert_difference('OrderRequest.count', -1) do
      delete order_request_url(@order_request)
    end

    assert_redirected_to order_requests_url
  end
end
