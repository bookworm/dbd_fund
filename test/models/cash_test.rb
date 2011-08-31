require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class CashControllerTest < Test::Unit::TestCase
  context "Cash Model" do
    should 'construct new instance' do
      @cash = Cash.new
      assert_not_nil @cash
    end
  end
end
