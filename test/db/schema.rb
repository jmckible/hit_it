ActiveRecord::Schema.define(:version=>0) do
  
  create_table :hits, :force=>true do |t|
    t.column :hitable_type, :string, :limit=>20
    t.column :hitable_id, :integer
    t.column :year, :integer
    t.column :month, :integer
    t.column :count, :integer, :default=>0
    t.column :created_at, :datetime
    t.column :updated_at, :datetime
  end
  
  create_table :pages, :force=>true do |t|
    t.column :title, :string
  end
  
end