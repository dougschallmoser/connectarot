class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :designation
      t.boolean :court
      t.integer :number
      t.string :suit
      t.string :meaning

      t.timestamps
    end
  end
end
