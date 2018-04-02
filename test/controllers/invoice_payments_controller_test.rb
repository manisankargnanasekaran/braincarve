require 'test_helper'

class InvoicePaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice_payment = invoice_payments(:one)
  end

  test "should get index" do
    get invoice_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_payment_url
    assert_response :success
  end

  test "should create invoice_payment" do
    assert_difference('InvoicePayment.count') do
      post invoice_payments_url, params: { invoice_payment: { amount_paid: @invoice_payment.amount_paid, invoice_id: @invoice_payment.invoice_id, payment_date: @invoice_payment.payment_date, payment_mode: @invoice_payment.payment_mode, reference_no: @invoice_payment.reference_no } }
    end

    assert_redirected_to invoice_payment_url(InvoicePayment.last)
  end

  test "should show invoice_payment" do
    get invoice_payment_url(@invoice_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_payment_url(@invoice_payment)
    assert_response :success
  end

  test "should update invoice_payment" do
    patch invoice_payment_url(@invoice_payment), params: { invoice_payment: { amount_paid: @invoice_payment.amount_paid, invoice_id: @invoice_payment.invoice_id, payment_date: @invoice_payment.payment_date, payment_mode: @invoice_payment.payment_mode, reference_no: @invoice_payment.reference_no } }
    assert_redirected_to invoice_payment_url(@invoice_payment)
  end

  test "should destroy invoice_payment" do
    assert_difference('InvoicePayment.count', -1) do
      delete invoice_payment_url(@invoice_payment)
    end

    assert_redirected_to invoice_payments_url
  end
end
