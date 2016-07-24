# Gaurav (gauravbg AT iitk DOT ac DOT in) - June 2009
class CreateJobApplications < ActiveRecord::Migration
  def self.up
    create_table :job_applications do |t|
      t.integer :job_opening_id,:null => false
      t.integer :student_id,:null => false
      t.string :status,:null => false

      # work needed here.. resume + approval

      t.timestamps
    end
  end

  def self.down
    drop_table :job_applications
  end
end

