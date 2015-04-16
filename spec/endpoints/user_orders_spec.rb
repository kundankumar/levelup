require 'spec_helper'

describe 'Levelup::Endpoints::UserOrders', :vcr => true do
  describe '#list' do
    it 'returns a user\'s order history' do
      response = @test_client.users.orders.list(TestConfig.user_token_with_read_orders_perms)
      (response).should be_success
      (response.orders).should_not be_nil
    end
  end
end
