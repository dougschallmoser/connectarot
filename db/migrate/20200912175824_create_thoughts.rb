class CreateThoughts < ActiveRecord::Migration[6.0]
  def change
    create_table :thoughts do |t|
      t.integer :entry_id

      t.timestamps
    end
  end
end
