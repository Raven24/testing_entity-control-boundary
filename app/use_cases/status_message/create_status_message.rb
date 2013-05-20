
class CreateStatusMessageCase < UseCase
  def exec!
    request_data.require(:author, :text)
    status_msg = StatusMessage.new({
      :guid => 'RaNdOm',
      :author => request_data.author,
      :text => request_data.text
    })
    StatusMessageCollection.add(status_msg)
    ResponseModel.new(id: status_msg.id, guid: status_msg.guid)
  end
end
