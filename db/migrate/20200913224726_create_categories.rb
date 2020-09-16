class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name, default: "Custom Spread"
      t.string :question_1
      t.string :question_2
      t.string :question_3

      t.timestamps
    end
  end
end
