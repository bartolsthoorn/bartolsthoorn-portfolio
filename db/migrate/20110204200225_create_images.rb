class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :name
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.references :work

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
