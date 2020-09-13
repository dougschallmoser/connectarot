class AddContentToThoughts < ActiveRecord::Migration[6.0]
  def change
    add_column :thoughts, :content, :string
  end
end
