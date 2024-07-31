class AddGroupIdToTasks < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM tasks'
    add_reference :tasks, :group, null: false, index: true
  end

  def down 
    remove_reference :tasks, :group, index: true
  end
end
