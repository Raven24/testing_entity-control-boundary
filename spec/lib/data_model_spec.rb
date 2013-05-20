
require 'spec_helper'

describe DataModel do
  before do
    @test_hash = { a: 'a', b: 'b', c: 'c' }
  end

  context 'data filtration' do
    it 'requires keys to exist in a hash' do
      t = TestDataModel.new @test_hash

      r = t.require(:a, :c)
      r.should include(a: 'a')
      r.should include(c: 'c')
      r.should_not include(:b)
    end

    it 'should remove all keys not required' do
      t = TestDataModel.new @test_hash

      r = t.require(:b)
      r.should include(b: 'b')
      r.should_not include(:a)
      r.should_not include(:c)
    end

    it 'produces an error if required keys are not present' do
      h = { a: 'a' }
      t = TestDataModel.new h

      expect { t.require(:c) }.to raise_error KeysMismatchError
    end
  end
end
