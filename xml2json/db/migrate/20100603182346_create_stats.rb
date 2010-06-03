class CreateStats < ActiveRecord::Migration
  def self.up
    create_table :stats do |t|
      t.string :url, :null => false
      t.string :title
      t.integer :accesses, :default => 0
      t.string :image

      t.timestamps
    end

    add_index :stats, :url
  end

  def self.down
    drop_table :stats
    remove_index :stats, :url
  end
end

