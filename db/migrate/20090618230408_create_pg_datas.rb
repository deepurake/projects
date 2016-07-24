# Gaurav (gauravbg AT iitk DOT ac DOT in) - June 2009
class CreatePgDatas < ActiveRecord::Migration
  def self.up
    create_table :pg_datas do |t|
      
      t.integer :student_id,:null => false
      
      t.string :entrance_rank,:null => false
      t.string :ug_college,:null => false
      t.string :ug_performance,:null => false
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :pg_datas
  end
end
