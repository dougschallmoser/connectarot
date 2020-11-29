class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.text :title
      t.text :description
      t.integer :requestor_id
      t.integer :responder_id

      t.timestamps
    end
  end
end
