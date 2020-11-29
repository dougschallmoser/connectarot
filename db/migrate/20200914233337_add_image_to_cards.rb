class AddImageToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :image, :text
  end
end
