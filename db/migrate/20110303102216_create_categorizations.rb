class CreateCategorizations < ActiveRecord::Migration
  def self.up
    create_table :categorizations do |t|
      t.integer :work_id
      t.integer :category_id
      t.datetime :created_at

      t.timestamps
    end
  end

  def self.down
    drop_table :categorizations
  end
end
