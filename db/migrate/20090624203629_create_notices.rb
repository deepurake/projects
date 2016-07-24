class CreateNotices < ActiveRecord::Migration
  def self.up
    create_table :notices do |t|

      t.string :title, :null => false
      t.string :attachment
      t.string :sent_to, :null => false, :limit => 1024
      t.text :content, :null => false
      t.datetime :created_at, :null => false
      t.datetime :updated_at, :null => false

    end
  end

  def self.down
    drop_table :notices
  end
end

