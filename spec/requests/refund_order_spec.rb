require 'spec_helper'

describe 'Levelup::Requests::RefundOrder' do
  before do
    @test_app_refund_request = Levelup::Requests::RefundOrder.new({})
  end

  describe '#auth_type' do
    it 'returns :merchant' do
      (@test_app_refund_request.auth_type).should == :merchant
    end
  end

  describe '#body' do
    it 'returns a hash wrapped in a refund tag' do
      (@test_app_refund_request.body[:refund]).should_not be_nil
    end
  end
end
