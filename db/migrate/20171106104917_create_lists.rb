class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :item_name
      t.date :due_date
      t.text :memo
      t.timestamps
    end
  end
end
