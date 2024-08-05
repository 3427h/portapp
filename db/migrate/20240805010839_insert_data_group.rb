class InsertDataGroup < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM groups'
    execute 'DELETE FROM tasks'
    execute 'DELETE FROM users'
    execute "INSERT INTO groups (gname, created_at, updated_at) VALUES ('全体', '#{Time.current.to_s}', '#{Time.current.to_s}')"
    execute "INSERT INTO groups (gname, created_at, updated_at) VALUES ('group1', '#{Time.current.to_s}', '#{Time.current.to_s}')"
    execute "INSERT INTO groups (gname, created_at, updated_at) VALUES ('group2', '#{Time.current.to_s}', '#{Time.current.to_s}')"
    execute "INSERT INTO groups (gname, created_at, updated_at) VALUES ('group3', '#{Time.current.to_s}', '#{Time.current.to_s}')"
  end

  def down 
    execute "DELETE FROM groups WHERE gname = '全体'"
  end
end
