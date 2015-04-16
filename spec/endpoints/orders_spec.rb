require 'spec_helper'

describe 'Levelup::Endpoints::Orders', :vcr => true do
  describe '#create' do
    context 'with an invalid user access token' do
      it 'returns an error response' do
        order_request = Levelup::Requests::CreateOrder.new(
          :items => [],
          :location_id => TestConfig.location_id,
          :spend_amount => 10,
          :merchant_access_token =>
            TestConfig.merchant_token_with_manage_orders_perms,
          :user_access_token => 'invalid'
        )
        (@test_client.orders.create(order_request)).should_not be_success
      end
    end

    context 'with a valid user access token' do
      it 'returns a successful order response' do
        order_request = Levelup::Requests::CreateOrder.new(
          :items => [],
          :location_id => TestConfig.location_id,
          :spend_amount => 10,
          :merchant_access_token =>
            TestConfig.merchant_token_with_manage_orders_perms,
          :user_access_token =>
            TestConfig.user_token_with_create_orders_perms
        )

        response = @test_client.orders.create(order_request)
        (response).should be_success
        (response.spend_amount).should == (order_request.spend_amount)
      end
    end
  end
end
