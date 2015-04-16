require 'spec_helper'

describe 'Levelup::Responses::Error' do
  before do
    @empty_response = Levelup::Responses::Error.new({}, [], 404)

    @nonempty_response = Levelup::Responses::Error.new(
      {
        'header' => 'value',
        'otherHeader' => 'secondValue'
      },
      [{
        'error' => {
          'property' => 'whatever',
          'object' => 'Elbereth',
          'message' => 'some message'
        }
      },
      {
        'error' => {
          'property' => 'some_prop',
          'object' => 'some_object',
          'message' => 'some other message'
        }
      }],
      404)
  end

  describe '#errors' do
    context 'for an object with no body hash' do
      it 'has no errors' do
        (@empty_response.errors).should == ([])
      end
    end

    context 'for an object with two full errors in its body hash' do
      it 'has two full errors' do
        (@nonempty_response).should have(2).errors
        @nonempty_response.errors.each do |error|
          (error.property).should_not be_nil
          (error.object).should_not be_nil
          (error.message).should_not be_nil
        end
      end
    end
  end

  describe '#headers' do
    context 'for an object with an empty supplied header' do
      it 'has empty headers' do
        (@empty_response.headers).should == ({})
      end
    end

    context 'for an object with a nonempty supplied header' do
      it 'has non-empty headers' do
        (@nonempty_response.headers).should_not be_empty
      end
    end
  end

  describe '#success?' do
    it 'returns false' do
      (@empty_response.success?).should be_false
    end
  end
end
