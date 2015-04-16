require 'spec_helper'

describe 'Levelup::Endpoints::SpecificPermissionsRequest', :vcr => true do
  before do
    @test_client.api_key = TestConfig.api_key_valid
    @test_client.secret = TestConfig.secret_valid
    auth = @test_client.access_tokens.create_for_app
    @test_client.app_access_token = auth.token
  end

  describe '#show' do
    it 'returns a permissions request' do
      perms_request = @test_client.apps.permissions_requests.create(
        :email => TestConfig.user_email,
        :permission_keynames => ['read_user_basic_info']
      )

      response = @test_client.apps.permissions_requests(perms_request.id).show
      (response).should be_success
      (response.permission_keynames).should == (['read_user_basic_info'])
    end
  end
end
