class AddPolicyNumberToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :policy_number, :string
  end
end
