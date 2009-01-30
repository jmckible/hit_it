class HitItMigration < ActiveRecord::Migration
  def self.up
    create_table :hits do |t|
      t.string  :hitable_type, :limit=>20 # Change if your model names are really long
      t.integer :hitable_id
      t.integer :year, :month
      t.integer :count, :default=>0
      t.timestamps
    end
    add_index :hits, [:hitable_id, :hitable_type]
  end
  
  
  def self.down
    drop_table :hits
  end
end