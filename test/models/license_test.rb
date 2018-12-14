require 'test_helper'

class LicenseTest < ActiveSupport::TestCase
  test 'should validate state is present' do
    license = License.find_or_create_by(state: nil)
    assert_not license.valid?
  end
end
