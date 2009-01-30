require File.join(File.dirname(__FILE__), 'test_helper')

class HitTest < Test::Unit::TestCase
  fixtures :all
  
  def test_belongs_to_hitable
    assert_equal hits(:home_january).hitable, pages(:home)
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
  
end