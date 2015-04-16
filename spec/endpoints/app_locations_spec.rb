require 'spec_helper'

describe 'Levelup::Endpoints::AppLocations', :vcr => true do
  describe '#list' do
    it 'fetches a list of locations' do
      response = @test_client.apps(TestConfig.app_id).locations.list

      (response).should be_success
      (response.locations.length).should be > 0
    end

    it 'fetches a second page of locations' do
      next_response = @test_client.apps(TestConfig.app_id).locations.list.next

      (next_response).should be_success
    end
  end
end
