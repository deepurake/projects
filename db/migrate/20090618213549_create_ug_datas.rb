# Gaurav (gauravbg AT iitk DOT ac DOT in) - June 2009
class CreateUgDatas < ActiveRecord::Migration
  def self.up
    create_table :ug_datas, :force => true do |t|
      
      t.integer :student_id,:null => false
      t.string :entrance_rank,:null => false
      t.string :place_of_intern,:null => false
      t.string :ppo,:null => false
      t.string :spo_intern,:null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :ug_datas
  end
end
