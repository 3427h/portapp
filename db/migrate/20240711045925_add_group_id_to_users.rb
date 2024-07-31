class AddGroupIdToUsers < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM users'
    add_reference :users, :group, null: false, index: true
  end

  def down 
    remove_reference :users, :group, index: true
  end
end
