require "application_system_test_case"

class InvoicesTest < ApplicationSystemTestCase
  setup do
    @invoice = invoices(:one)
  end

  test "visiting the index" do
    visit invoices_url
    assert_selector "h1", text: "Invoices"
  end

  test "creating a Invoice" do
    visit invoices_url
    click_on "New Invoice"

    fill_in "Discount", with: @invoice.discount
    fill_in "From address", with: @invoice.from_address
    fill_in "From email", with: @invoice.from_email
    fill_in "From full name", with: @invoice.from_full_name
    fill_in "From phone", with: @invoice.from_phone
    fill_in "Status", with: @invoice.status
    fill_in "To address", with: @invoice.to_address
    fill_in "To email", with: @invoice.to_email
    fill_in "To full name", with: @invoice.to_full_name
    fill_in "To phone", with: @invoice.to_phone
    fill_in "Vat", with: @invoice.vat
    click_on "Create Invoice"

    assert_text "Invoice was successfully created"
    click_on "Back"
  end

  test "updating a Invoice" do
    visit invoices_url
    click_on "Edit", match: :first

    fill_in "Discount", with: @invoice.discount
    fill_in "From address", with: @invoice.from_address
    fill_in "From email", with: @invoice.from_email
    fill_in "From full name", with: @invoice.from_full_name
    fill_in "From phone", with: @invoice.from_phone
    fill_in "Status", with: @invoice.status
    fill_in "To address", with: @invoice.to_address
    fill_in "To email", with: @invoice.to_email
    fill_in "To full name", with: @invoice.to_full_name
    fill_in "To phone", with: @invoice.to_phone
    fill_in "Vat", with: @invoice.vat
    click_on "Update Invoice"

    assert_text "Invoice was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoice" do
    visit invoices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoice was successfully destroyed"
  end
end
