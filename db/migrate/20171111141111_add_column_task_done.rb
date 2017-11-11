class AddColumnTaskDone < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :task_done, :boolean, default: false
  end
end
