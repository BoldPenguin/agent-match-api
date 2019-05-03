require 'test_helper'

class AgentTest < ActiveSupport::TestCase
  test 'should validate name is present' do
    agent = Agent.find_or_create_by(name: nil, phone_number: '(614) 999-9999')
    assert_not agent.valid?
  end

  test 'should validate phone number is present' do
    agent = Agent.find_or_create_by(name: 'Perry Penguin', phone_number: nil)
    assert_not agent.valid?
  end

  test 'should be valid when both name and phone number are present' do
    agent = Agent.find_or_create_by(name: 'Perry Penguin', phone_number: '(614) 999-9999')
    assert agent.valid?
  end

  test 'James should be licensed in OH and KY' do
    james = Agent.find_by_name('James Willhelm')
    assert james.licenses.where(:state => 'OH').any?
    assert james.licenses.where(:state => 'KY').any?
    assert_equal 2, james.licenses.size
  end

  test 'James should work with Big City' do
    james = Agent.find_by_name('James Willhelm')
    assert james.carriers.where(:name => 'Big City Mutual Insurance').any?
    assert_equal 1, james.carriers.size
  end
end
