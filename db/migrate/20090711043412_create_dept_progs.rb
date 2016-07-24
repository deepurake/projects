class CreateDeptProgs < ActiveRecord::Migration
  def self.up
    create_table :dept_progs do |t|
      t.string :dept_prog,:limit => 2048
    end
  end

  def self.down
  end
end

