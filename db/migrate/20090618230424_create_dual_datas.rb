# Gaurav (gauravbg AT iitk DOT ac DOT in) - June 2009
class CreateDualDatas < ActiveRecord::Migration
  def self.up
    create_table :dual_datas do |t|
      
      t.integer :student_id,:null => false
      
      
      t.float :ug_cpi,:null => false
      t.float :pg_cpi,:null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :dual_datas
  end
end
