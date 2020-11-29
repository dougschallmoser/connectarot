class AddContentToThoughts < ActiveRecord::Migration[6.0]
  def change
    add_column :thoughts, :content, :text
  end
end
