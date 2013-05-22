
require 'spec_helper'

describe Application do
  it 'is an Entity' do
    Application.should be < Entity
  end
  
  it 'contains attributes for an application' do
    Application.attribute_names.should include(
      'name', 
      'url',
      'version',
      'author_name', 
      'author_handle')
  end
  
end