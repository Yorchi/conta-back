class CreateInvoicesTable < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.string :invoice_number
      t.numeric :total
      t.datetime :invoice_date
      t.string :status
    end
  end
end
