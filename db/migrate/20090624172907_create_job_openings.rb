# Gaurav (gauravbg AT iitk DOT ac DOT in) - June 2009
class CreateJobOpenings < ActiveRecord::Migration
  def self.up
    create_table :job_openings, :force => true do |t|
      t.integer :company_id,:null => false

      t.string  :nature,:null => false
      t.string  :designation,:null => false
      t.text   :description,:null => false
      t.boolean :intern,:null => false
      t.string  :package_btech
      t.string  :package_mtech
      t.string  :package_dual
      t.string  :package_msci
      t.string  :package_msc2
      t.string  :package_mba
      t.string  :package_mdes
      t.string  :package_phd
      t.string  :package_details
      t.boolean :bond,:null => false
      t.string  :bond_details
      t.string :medical_requirements,:null => false
      t.boolean :resume_shortlist,:null => false
      t.string :resume_criteria
      t.boolean :aptitude,:null => false
      t.boolean :gd,:null => false
      t.boolean :tech_test,:null => false
      t.boolean :tech_interview,:null => false
      t.integer :no_rounds,:null =>false
      t.boolean :hr_interview,:null => false
      t.string  :contact_details1,:null => false,:limit => 1024
      t.string  :contact_details2,:limit => 1024
      t.string  :contact_details3,:limit => 1024
      t.boolean :published,:null => false     # set by admin
      t.datetime  :application_deadline,:null => false

      t.string    :eligibility,:null => false,:limit => 1024

      t.timestamps
    end
  end

  def self.down
    drop_table :job_openings
  end
end

