require File.join(File.dirname(__FILE__), 'test_helper')

class HitItTest < Test::Unit::TestCase
  fixtures :all
  
  def test_has_many_hits
    assert_equal pages(:home).hits, hits(:home_january, :home_february)
  end
  
end