require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class DonorControllerTest < Test::Unit::TestCase
  context "Donor Model" do
    should 'construct new instance' do
      @donor = Donor.new
      assert_not_nil @donor
    end
  end
end
