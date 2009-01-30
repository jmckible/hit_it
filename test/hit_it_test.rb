require File.join(File.dirname(__FILE__), 'test_helper')

class HitItTest < Test::Unit::TestCase
  fixtures :all
  
  def test_has_many_hits
    assert_equal pages(:home).hits, hits(:home_january, :home_february)
  end
  
  def test_sum_hits
    assert_equal 14, pages(:home).hits.sum(:count)
    assert_equal 10, pages(:home).hits.for(2009, 1).sum(:count)
  end
  
end