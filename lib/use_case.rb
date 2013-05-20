
class UseCase
  def initialize(request)
    raise ArgumentError.new "#{self.class.to_s} was initialized with an unrecognized data structure" unless request.is_a? RequestModel
    @_request_data = request
  end

  def exec!
    raise "this method has to be overwritten by a subclass"
  end

  def request_data
    @_request_data
  end

  def response_data
    @_response_data
  end

  private

  def response_data=(response)
    @_response_data = response
  end
end
