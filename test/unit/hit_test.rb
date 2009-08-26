require 'test_helper'

class HitTest < ActiveSupport::TestCase
  
  test 'belongs to hitable' do
    assert_equal pages(:home), hits(:home_january).hitable
  end
  
  test 'requires hitable' do
    hit = Hit.create
    assert_match /blank/, hit.errors[:hitable_id].to_s
    assert_match /blank/, hit.errors[:hitable_type].to_s
  end
  
  test 'requires date' do
    hit = Hit.create
    assert_match /blank/, hit.errors[:year].to_s
    assert_match /blank/, hit.errors[:month].to_s
  end
  
  test 'unique relationship' do
    hit = hits(:home_january).clone
    hit.valid?
    assert_match /taken/, hit.errors[:month].to_s
  end
  
  test 'for named scoped' do
    assert_equal [hits(:home_january)], Hit.for(2009, 1)
  end
  
end