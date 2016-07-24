# Gaurav (gauravbg AT iitk DOT ac DOT in) - June 2009
class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students, :force => true do |t|

      t.integer :department_id,:null => false
      t.integer :program_id,:null => false
      
      
      t.string :roll_no,:null => false
      t.string :name,:null => false
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
