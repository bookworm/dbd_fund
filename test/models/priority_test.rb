require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class PriorityControllerTest < Test::Unit::TestCase
  context "Priority Model" do
    should 'construct new instance' do
      @priority = Priority.new
      assert_not_nil @priority
    end
  end
end
