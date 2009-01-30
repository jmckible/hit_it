module HitIt
  def self.include(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def track_hits
      return if self.included_modules.include? HitIt::InstanceMethods
      __send__ :include, HitIt::InstanceMethods
    end
  end
  
  module InstanceMethods
  end
  
end