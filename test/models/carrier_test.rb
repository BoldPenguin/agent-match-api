require 'test_helper'

class CarrierTest < ActiveSupport::TestCase
  test 'should validate name is present' do
    carrier = Carrier.find_or_create_by(name: nil)
    assert_not carrier.valid?
  end
  test 'Big City should have an industry' do
    carrier = Carrier.find_by_name('Big City Mutual Insurance')
    assert_equal 1, carrier.industries.size
  end
end
