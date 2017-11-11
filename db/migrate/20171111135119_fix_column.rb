class FixColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :lists, :task_done
    add_column :lists, :status, :integer, default: 0
  end
end
