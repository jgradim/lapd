class CreateApis < ActiveRecord::Migration
  def self.up
    create_table :apis do |t|
      t.string :url, :null => false
      t.string :title
      t.integer :accesses, :default => 0

      t.timestamps
    end

    add_index :apis, :url
  end

  def self.down
    drop_table :apis
    remove_index :apis, :url
  end
end

