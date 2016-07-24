# Gaurav (gauravbg AT iitk DOT ac DOT in) - June 2009
class CreatePhdDatas < ActiveRecord::Migration
  def self.up
    create_table :phd_datas do |t|
      
      t.integer :student_id
      
      t.string :ug_college
      t.string :ug_performance
      t.string :pg_college
      t.string :pg_performance
      
      t.timestamps
    end
  end

  def self.down
    drop_table :phd_datas
  end
end
