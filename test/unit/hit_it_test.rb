require 'test_helper'

class HitItTest < ActiveSupport::TestCase
  
  test 'has many hits' do
    assert_equal hits(:home_january, :home_february), pages(:home).hits
  end
  
  test 'sum hits' do
    assert_equal 14, pages(:home).hits.sum(:count)
    assert_equal 10, pages(:home).hits.for(2009, 1).sum(:count)
  end
  
  test 'hit existing month' do
    pages(:home).hit!(Date.new(2009, 1, 1))
    assert_equal 11, hits(:home_january).count
  end
  
  test 'hit new month' do
    hit_count = Hit.count
    pages(:home).hit!(Date.new(2009, 3, 1))
    assert_equal (hit_count+1), Hit.count
    assert_equal 1, pages(:home).hits.last.count
  end
  
end