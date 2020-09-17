class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.string :custom_meaning

      t.timestamps
    end
  end
end
