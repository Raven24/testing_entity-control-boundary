
require 'spec_helper'

describe UseCase do
  before do
    @test_data = RequestModel.new(asdf: 'asdf', qwer: 'qwer')
  end

  context '#initialize' do
    it 'sets the internal data' do
      u = UseCase.new @test_data

      u.request_data.should be @test_data
      u.response_data.should be_nil
    end

    it 'does produces an error when the argument is wrong' do
      expect { UseCase.new :symbol }.to raise_error ArgumentError
      expect { UseCase.new [ :asdf, :qwer ] }.to raise_error ArgumentError
      expect { UseCase.new({ bla: 'bla', xyz: 'xyz' }) }.to raise_error ArgumentError
    end
  end

  context '#exec!' do
    it 'throws an exception in the base implementation' do
      u = UseCase.new @test_data
      expect { u.exec! }.to raise_error
    end

    it 'does whatever the subclasses want' do
      u = TestUseCase.new @test_data
      u.exec!.should be_true
    end
  end
end
