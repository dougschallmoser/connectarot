class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.text :name, default: "Custom Spread"
      t.text :question_1
      t.text :question_2
      t.text :question_3

      t.timestamps
    end
  end
end
