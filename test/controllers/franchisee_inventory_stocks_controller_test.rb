require 'test_helper'

class FranchiseeInventoryStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @franchisee_inventory_stock = franchisee_inventory_stocks(:one)
  end

  test "should get index" do
    get franchisee_inventory_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_franchisee_inventory_stock_url
    assert_response :success
  end

  test "should create franchisee_inventory_stock" do
    assert_difference('FranchiseeInventoryStock.count') do
      post franchisee_inventory_stocks_url, params: { franchisee_inventory_stock: { available_qty: @franchisee_inventory_stock.available_qty, franchisee_id: @franchisee_inventory_stock.franchisee_id, inventory_item_id: @franchisee_inventory_stock.inventory_item_id } }
    end

    assert_redirected_to franchisee_inventory_stock_url(FranchiseeInventoryStock.last)
  end

  test "should show franchisee_inventory_stock" do
    get franchisee_inventory_stock_url(@franchisee_inventory_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_franchisee_inventory_stock_url(@franchisee_inventory_stock)
    assert_response :success
  end

  test "should update franchisee_inventory_stock" do
    patch franchisee_inventory_stock_url(@franchisee_inventory_stock), params: { franchisee_inventory_stock: { available_qty: @franchisee_inventory_stock.available_qty, franchisee_id: @franchisee_inventory_stock.franchisee_id, inventory_item_id: @franchisee_inventory_stock.inventory_item_id } }
    assert_redirected_to franchisee_inventory_stock_url(@franchisee_inventory_stock)
  end

  test "should destroy franchisee_inventory_stock" do
    assert_difference('FranchiseeInventoryStock.count', -1) do
      delete franchisee_inventory_stock_url(@franchisee_inventory_stock)
    end

    assert_redirected_to franchisee_inventory_stocks_url
  end
end
