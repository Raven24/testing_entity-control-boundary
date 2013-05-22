
require 'spec_helper'

describe StatusMessage do
  it 'is an Entity' do
    StatusMessage.should be < Entity
  end
  
  it 'contains all status message attributes' do
    StatusMessage.attribute_names.should include('id', 'guid', 'author', 'text')
  end

  it 'stores information' do
    s = StatusMessage.new(author: "test", text: "Testing 123")

    s.author.should eq "test"
    s.text.should eq "Testing 123"
  end
end
