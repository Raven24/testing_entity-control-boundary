
require 'spec_helper'

describe CreateStatusMessageCase do
  context '#exec!' do
    before do
      @request = RequestModel.new({ author: 123, text: 'asdf 123 blabla' })
    end

    context 'requires some fields to be present' do
      it 'fails without author' do
        creator = CreateStatusMessageCase.new(RequestModel.new({ text: 'asdf' }))
        expect { creator.exec! }.to raise_error KeysMismatchError
      end

      it 'fails without content' do
        creator = CreateStatusMessageCase.new(RequestModel.new({ author: 234 }))
        expect { creator.exec! }.to raise_error KeysMismatchError
      end
    end

    context 'creates an entity' do
      before do
        @creator = CreateStatusMessageCase.new @request
      end

      it 'persists it' do
        lambda do
          @creator.exec!
        end.should change(StatusMessageCollection, :count).by(1)
      end

      it 'returns id and guid of the new entitiy' do
        response = @creator.exec!

        response.id.should be > 0
        response.guid.should have_at_least(6).characters
      end
    end
  end
end
