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

  test 'Gemma should work with Big City and Omaha' do
    gemma = Agent.find_by_name('Gemma Ritchie')
    assert gemma.carriers.where(:name => 'Big City Mutual Insurance').any?
    assert gemma.carriers.where(:name => 'Omaha Insurance Company').any?
    assert_equal 2, gemma.carriers.size
  end
end
