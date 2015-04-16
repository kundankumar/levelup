require 'spec_helper'

describe 'Levelup::Requests::GetOrder' do
  before do
    @test_order_deets_request = Levelup::Requests::GetOrder.new
  end

  describe '#auth_type' do
    it 'returns :merchant_v14' do
      (@test_order_deets_request.auth_type).should == :merchant_v14
    end
  end
end
