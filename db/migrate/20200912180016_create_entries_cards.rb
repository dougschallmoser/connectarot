class CreateEntriesCards < ActiveRecord::Migration[6.0]
  def change
    create_table :entries_cards do |t|
      t.integer :entry_id
      t.integer :card_id

      t.timestamps
    end
  end
end
