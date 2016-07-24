# Gaurav (gauravbg AT iitk DOT ac DOT in) - June 2009
class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string :name,:null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :admins
  end
end

