require 'test_helper'

class WithTest < MiniTest::Unit::TestCase
      
  def test_with_exists
    require 'ruby-with/global'
    self.must_respond_to :with, "Doesn't respond to :with"
  end
  
end