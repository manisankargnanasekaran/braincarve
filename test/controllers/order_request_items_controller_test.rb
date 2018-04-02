require 'test_helper'

class OrderRequestItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_request_item = order_request_items(:one)
  end

  test "should get index" do
    get order_request_items_url
    assert_response :success
  end

  test "should get new" do
    get new_order_request_item_url
    assert_response :success
  end

  test "should create order_request_item" do
    assert_difference('OrderRequestItem.count') do
      post order_request_items_url, params: { order_request_item: { amount: @order_request_item.amount, cost_per_item: @order_request_item.cost_per_item, inventory_item_id: @order_request_item.inventory_item_id, order_request_id: @order_request_item.order_request_id, request_qty: @order_request_item.request_qty } }
    end

    assert_redirected_to order_request_item_url(OrderRequestItem.last)
  end

  test "should show order_request_item" do
    get order_request_item_url(@order_request_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_request_item_url(@order_request_item)
    assert_response :success
  end

  test "should update order_request_item" do
    patch order_request_item_url(@order_request_item), params: { order_request_item: { amount: @order_request_item.amount, cost_per_item: @order_request_item.cost_per_item, inventory_item_id: @order_request_item.inventory_item_id, order_request_id: @order_request_item.order_request_id, request_qty: @order_request_item.request_qty } }
    assert_redirected_to order_request_item_url(@order_request_item)
  end

  test "should destroy order_request_item" do
    assert_difference('OrderRequestItem.count', -1) do
      delete order_request_item_url(@order_request_item)
    end

    assert_redirected_to order_request_items_url
  end
end
