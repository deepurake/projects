class CreatePreferences < ActiveRecord::Migration
  def self.up
    create_table :preferences do |t|
      t.integer :pref1,:null=>false
      t.integer :pref2,:null=>false
      t.integer :pref3,:null=>false
      t.integer :pref4,:null=>false
      t.integer :pref5,:null=>false
      t.integer :pref6,:null=>false
      t.integer :pref7,:null=>false
      t.integer :pref8,:null=>false
    end
  end

  def self.down
    drop_table :preferences
  end
end
