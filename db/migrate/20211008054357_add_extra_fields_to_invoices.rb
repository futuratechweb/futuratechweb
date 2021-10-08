class AddExtraFieldsToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :policy_no, :integer
    add_column :invoices, :date_of_commencement_of_policy, :string
    add_column :invoices, :date_of_commencement_of_risk, :string
    add_column :invoices, :plan_and_policy, :string
    add_column :invoices, :date_of_maturity, :string
    add_column :invoices, :basic_sum_assured, :integer
    add_column :invoices, :accidental_benefit_sum_assured, :integer
    add_column :invoices, :premium_for_plan, :integer
    add_column :invoices, :total_premium_amount_rs, :integer
    add_column :invoices, :date_of_paid, :integer
    add_column :invoices, :date_of_birth_of_assured, :string
    add_column :invoices, :age_of_the_life_assured, :integer
    add_column :invoices, :nominee_name, :string
    add_column :invoices, :nominee_relation, :string
    add_column :invoices, :proposal_no, :integer
    add_column :invoices, :date_of_proposal, :string
    add_column :invoices, :assured_full_name, :string
    add_column :invoices, :name_of_proposer, :string
    add_column :invoices, :address_of_proposer, :string
    add_column :invoices, :address_of_assured, :string
  end
end
