class AddFieldsToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :transaction_id, :string
    add_column :invoices, :amount, :integer
  end
end
