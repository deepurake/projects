# Gaurav (gauravbg AT iitk DOT ac DOT in) - June 2009
class CreatePrograms < ActiveRecord::Migration
  def self.up
    create_table :programs do |t|

      t.string :name,:null => false
      t.string :fullname,:null=>false
    end
  end

  def self.down
    drop_table :programs
  end
end

