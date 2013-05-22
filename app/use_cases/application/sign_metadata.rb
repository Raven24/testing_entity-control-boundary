
class SignMetadataCase < UseCase
  def exec!
    req = request_data.require(:private_key, :appdata)
    app_data = request_data.appdata
    app = Application.new(
      name: app_data[:name],
      version: app_data[:version],
      url: app_data[:url],
      author_name: app_data[:author_name],
      author_handle: app_data[:author_handle])
    
    json_string = JSON.dump(app.attributes)
    signature = request_data.private_key.sign(OpenSSL::Digest::SHA256.new, json_string)
    
    resp = ResponseModel.new(signature: Base64.strict_encode64(signature))
  end
end