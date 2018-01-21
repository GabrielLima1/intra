class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :file
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
