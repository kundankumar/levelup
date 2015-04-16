require 'spec_helper'

describe 'Levelup::Responses::Success' do
  before do
    @test_response = Levelup::Responses::Success.new({})
  end

  describe '#success?' do
    it 'returns true' do
      (@test_response.success?).should be_true
    end
  end
end
