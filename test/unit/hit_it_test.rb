require 'test_helper'

class HitItTest < ActiveSupport::TestCase
  
  def test_has_many_hits
    assert_equal hits(:home_january, :home_february), pages(:home).hits
  end
  
  def test_sum_hits
    assert_equal 14, pages(:home).hits.sum(:count)
    assert_equal 10, pages(:home).hits.for(2009, 1).sum(:count)
  end
  
  def test_hit_existing_month
    pages(:home).hit!(Date.new(2009, 1, 1))
    assert_equal 11, hits(:home_january).count
  end
  
  def test_hit_new_month
    hit_count = Hit.count
    pages(:home).hit!(Date.new(2009, 3, 1))
    assert_equal (hit_count+1), Hit.count
    assert_equal 1, pages(:home).hits.last.count
  end
  
end