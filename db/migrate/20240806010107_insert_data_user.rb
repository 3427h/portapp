class InsertDataUser < ActiveRecord::Migration[5.2]
  def up
    execute "INSERT INTO users (name, password_digest, created_at, updated_at, group_id) VALUES ('admin', '#{BCrypt::Password.create("admin1006")}', '#{Time.current.to_s}', '#{Time.current.to_s}', 1)"
  end



  def down 
    execute "DELETE FROM users WHERE name = 'admin'"
  end
end
