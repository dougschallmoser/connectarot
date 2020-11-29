class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :request_id
      t.text :interpretation_1
      t.text :interpretation_2
      t.text :interpretation_3

      t.timestamps
    end
  end
end
