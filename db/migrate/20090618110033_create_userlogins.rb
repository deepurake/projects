class CreateUserlogins < ActiveRecord::Migration
  def self.up
    create_table :userlogins do |t|
     t.string :login, :null => false, :limit => 15
     t.string :crypted_password, :null => false
     t.references :loginable, :polymorphic => true
     t.string :password_salt, :null => false, :limit => 40
     t.string :persistence_token, :null => false
     t.datetime :last_request_at, :null => false
     t.datetime  :last_login_at, :null => false
     t.string    :last_login_ip, :null => false, :limit => 16
   end
  end

  def self.down
    drop_table :userlogins
  end
end

