class AddKindToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :kind, :string
    add_column :users, :name, :string
  end
end
