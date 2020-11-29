class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.text :name
      t.text :designation
      t.boolean :court
      t.integer :number
      t.text :suit
      t.text :meaning

      t.timestamps
    end
  end
end
