class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.text :name
      t.references :category, foreign_key: true

      t.timestamps
    end
      add_index :words, [:category_id, :created_at]
  end
end
