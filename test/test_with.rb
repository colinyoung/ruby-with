require 'test_helper'

class WithTest < MiniTest::Unit::TestCase
  require 'ruby-with/global'
      
  def test_with_exists
    self.must_respond_to :with, "Doesn't respond to :with"
  end
  
  def test_with_can_invert_context
    with Person.new do |context|
      context.class.must_equal WithTest
      self.class.must_equal Person
    end
  end
  
  def test_can_set_things_at_start
    with Person.new, first_name: 'Rue' do
      first_name.must_equal 'Rue'
      
      set first_name: 'Adolfo'
      first_name.must_equal 'Adolfo'
      
      self <= { first_name: 'George' }
      first_name.must_equal 'George'
    end
  end
  
end