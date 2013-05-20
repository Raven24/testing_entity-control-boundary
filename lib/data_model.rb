
module DataModel
  def require(*required_keys)
    req = [*required_keys]
    result = to_h.select do |k|
      req.include? k
    end

    raise KeysMismatchError.new "not all required keys were contained in the data" if req.size != result.size
    result
  end
end
