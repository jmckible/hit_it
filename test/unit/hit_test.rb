require 'test_helper'

class HitTest < ActiveSupport::TestCase
  
  def test_belongs_to_hitable
    assert_equal pages(:home), hits(:home_january).hitable
  end
  
  def test_requires_hitable
    hit = Hit.create
    assert_match /blank/, hit.errors[:hitable_id].to_s
    assert_match /blank/, hit.errors[:hitable_type].to_s
  end
  
  def test_requires_date
    hit = Hit.create
    assert_match /blank/, hit.errors[:year].to_s
    assert_match /blank/, hit.errors[:month].to_s
  end
  
  def test_unique_relationship
    hit = hits(:home_january).clone
    hit.valid?
    assert_match /taken/, hit.errors[:month].to_s
  end
  
  def test_for_named_scope
    assert_equal [hits(:home_january)], Hit.for(2009, 1)
  end
  
end