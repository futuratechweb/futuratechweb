require "test_helper"

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_url
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post invoices_url, params: { invoice: { discount: @invoice.discount, from_address: @invoice.from_address, from_email: @invoice.from_email, from_full_name: @invoice.from_full_name, from_phone: @invoice.from_phone, status: @invoice.status, to_address: @invoice.to_address, to_email: @invoice.to_email, to_full_name: @invoice.to_full_name, to_phone: @invoice.to_phone, vat: @invoice.vat } }
    end

    assert_redirected_to invoice_url(Invoice.last)
  end

  test "should show invoice" do
    get invoice_url(@invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_url(@invoice)
    assert_response :success
  end

  test "should update invoice" do
    patch invoice_url(@invoice), params: { invoice: { discount: @invoice.discount, from_address: @invoice.from_address, from_email: @invoice.from_email, from_full_name: @invoice.from_full_name, from_phone: @invoice.from_phone, status: @invoice.status, to_address: @invoice.to_address, to_email: @invoice.to_email, to_full_name: @invoice.to_full_name, to_phone: @invoice.to_phone, vat: @invoice.vat } }
    assert_redirected_to invoice_url(@invoice)
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete invoice_url(@invoice)
    end

    assert_redirected_to invoices_url
  end
end
