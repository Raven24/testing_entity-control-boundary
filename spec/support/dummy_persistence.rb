
module DummyPersistence
  module DummyCollection
    @@_collection = {}
    @@_curr_id = 0

    def add(item)
      raise "the item already has an id" unless item.id.nil?

      @@_curr_id += 1
      item.id = @@_curr_id
      @@_collection[@@_curr_id] = item
    end

    def find(id)
      @@_collection[id]
    end

    def count
      @@_collection.size
    end
  end

  class StatusMessageCollection
    extend DummyCollection
  end
end

include DummyPersistence
