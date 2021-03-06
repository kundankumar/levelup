require 'spec_helper'
require 'securerandom'

describe 'Levelup::Endpoints::AppUsers', :vcr => true do
  before do
    @test_client.api_key = TestConfig.api_key_valid
    @test_client.secret = TestConfig.secret_valid
    auth = @test_client.access_tokens.create_for_app
    @test_client.app_access_token = auth.token
  end

  describe '#create' do
    it 'creates a user' do
      response = @test_client.apps.users.create(
        :api_key => TestConfig.api_key_valid,
        :user => {
          :email => 'some' + SecureRandom.hex(3) + '@example.com',
          :first_name => 'firstname',
          :last_name => 'lastname'
        },
        :permission_keynames => ['create_orders']
      )

      (response).should be_success
      (response.user.last_name).should == ('lastname')
    end
  end
end
