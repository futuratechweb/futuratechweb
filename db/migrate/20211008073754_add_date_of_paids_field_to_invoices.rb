class AddDateOfPaidsFieldToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :date_for_paid, :string
  end
end
