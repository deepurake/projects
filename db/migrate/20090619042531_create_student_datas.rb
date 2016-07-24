# Gaurav (gauravbg AT iitk DOT ac DOT in) - June 2009
class CreateStudentDatas < ActiveRecord::Migration
  def self.up
    create_table :student_datas , :force => true do |t|
      
      t.integer :student_id,:null => false
      
      
      t.string :father_name,:null => false
      t.string :iitk_email,:null => false
      t.string :alternate_email,:null => false
      t.string :mobile_no,:null => false
      t.string :friend_mobile_no,:null => false
      t.string :residence_phone_no,:null => false
      t.string :iitk_adress,:null => false
      t.string :home_address,:null => false
      #t.string :iitk_hall,:null => false
      #t.string :iitk_room_no,:null => false
      t.string :marks_10,:null => false
      t.string :board_10,:null => false
      t.string :year_10,:null => false
      t.string :marks_12,:null => false
      t.string :board_12,:null => false
      t.string :year_12,:null => false
      t.date :bday,:null => false
      t.string :gender,:null => false
      t.string :category,:null => false
      t.string :guide1_name,:null => false
      t.string :guide1_email,:null => false
      t.string :guide2_name
      t.string :guide2_email
      t.string :expected_grad_date,:null => false;
      
      t.float  :cpi,:null => false;    # for dual.. this field is [ug_cpi, pg_cpi].max
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :student_datas
  end
end
