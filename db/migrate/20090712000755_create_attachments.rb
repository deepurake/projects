class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      
      t.string :uid
      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
      
      t.references :attachable, :polymorphic => true
      t.string :type
      t.timestamps
    end
    add_index :attachments, :uid, :unique => true
  end

  def self.down
    drop_table :attachments
  end
end
