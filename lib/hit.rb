class Hit < ActiveRecord::Base
  
  belongs_to :hitable, :polymorphic=>true
  
  validates_presence_of   :hitable_id, :hitable_type
  validates_presence_of   :year, :month
  validates_uniqueness_of :month, :scope=>[:year, :hitable_id, :hitable_type]
  
end