class AddPaidToLoans < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :paid, :boolean, null: false, default: false
  end
end
