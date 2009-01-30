module HitIt
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def track_hits
      return if self.included_modules.include? HitIt::InstanceMethods
      __send__ :include, HitIt::InstanceMethods
      
      has_many :hits, :as=>:hitable, :order=>'year, month'
    end
  end
  
  module InstanceMethods
  end
  
end