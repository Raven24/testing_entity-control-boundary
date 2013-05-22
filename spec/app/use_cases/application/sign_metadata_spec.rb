
require 'spec_helper'

describe SignMetadataCase do
  before do
    @privkey = OpenSSL::PKey::RSA.generate(512)
    @appdata = { name: 'Dummy App', version: '0.1', url: 'http://myapp.net',
                 author_name: 'Alice', author_handle: 'alice@somepod.net'}
  end
  
  context 'requires request fields to be present' do
    it 'missing appdata' do
      req = RequestModel.new(private_key: @privkey)
      signer = SignMetadataCase.new req
      expect { signer.exec! }.to raise_error KeysMismatchError
    end
    
    it 'missing private key' do
      req = RequestModel.new(appdata: @appdata)
      signer = SignMetadataCase.new req
      expect { signer.exec! }.to raise_error KeysMismatchError
    end
  end
  
  it 'returns a valid Base64 string' do
    req = RequestModel.new(private_key: @privkey, appdata: @appdata)
    signer = SignMetadataCase.new req
    resp = signer.exec!
   
    expect { Base64.strict_decode64(resp.signature) }.not_to raise_error
  end
end