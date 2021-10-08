class AddInvoiceNumberToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :invoice_number, :integer
  end
end
