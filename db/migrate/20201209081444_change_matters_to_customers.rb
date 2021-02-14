class ChangeMattersToCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_table :matters, :customers
  end
end
