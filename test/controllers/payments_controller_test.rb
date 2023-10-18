require "test_helper"

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get payments_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_url
    assert_response :success
  end

  test "should create payment" do
    assert_difference("Payment.count") do
      post payments_url, params: { payment: { buyer_email: @payment.buyer_email, buyer_name: @payment.buyer_name, buyer_phone: @payment.buyer_phone, order_number: @payment.order_number, payment_id: @payment.payment_id, payment_method: @payment.payment_method, payment_status: @payment.payment_status, receipt_url: @payment.receipt_url, retry_url: @payment.retry_url, status_url: @payment.status_url, transaction_amount: @payment.transaction_amount } }
    end

    assert_redirected_to payment_url(Payment.last)
  end

  test "should show payment" do
    get payment_url(@payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_url(@payment)
    assert_response :success
  end

  test "should update payment" do
    patch payment_url(@payment), params: { payment: { buyer_email: @payment.buyer_email, buyer_name: @payment.buyer_name, buyer_phone: @payment.buyer_phone, order_number: @payment.order_number, payment_id: @payment.payment_id, payment_method: @payment.payment_method, payment_status: @payment.payment_status, receipt_url: @payment.receipt_url, retry_url: @payment.retry_url, status_url: @payment.status_url, transaction_amount: @payment.transaction_amount } }
    assert_redirected_to payment_url(@payment)
  end

  test "should destroy payment" do
    assert_difference("Payment.count", -1) do
      delete payment_url(@payment)
    end

    assert_redirected_to payments_url
  end
end