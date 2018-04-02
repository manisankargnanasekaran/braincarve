require 'test_helper'

class CompanyInventoryStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_inventory_stock = company_inventory_stocks(:one)
  end

  test "should get index" do
    get company_inventory_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_company_inventory_stock_url
    assert_response :success
  end

  test "should create company_inventory_stock" do
    assert_difference('CompanyInventoryStock.count') do
      post company_inventory_stocks_url, params: { company_inventory_stock: { available_qty: @company_inventory_stock.available_qty, inventory_item_id: @company_inventory_stock.inventory_item_id } }
    end

    assert_redirected_to company_inventory_stock_url(CompanyInventoryStock.last)
  end

  test "should show company_inventory_stock" do
    get company_inventory_stock_url(@company_inventory_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_inventory_stock_url(@company_inventory_stock)
    assert_response :success
  end

  test "should update company_inventory_stock" do
    patch company_inventory_stock_url(@company_inventory_stock), params: { company_inventory_stock: { available_qty: @company_inventory_stock.available_qty, inventory_item_id: @company_inventory_stock.inventory_item_id } }
    assert_redirected_to company_inventory_stock_url(@company_inventory_stock)
  end

  test "should destroy company_inventory_stock" do
    assert_difference('CompanyInventoryStock.count', -1) do
      delete company_inventory_stock_url(@company_inventory_stock)
    end

    assert_redirected_to company_inventory_stocks_url
  end
end
