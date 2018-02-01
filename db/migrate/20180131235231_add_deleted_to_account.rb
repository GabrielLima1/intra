class AddDeletedToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :deleted, :boolean
  end
end
