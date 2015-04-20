require 'ostruct'

module Levelup
  module Responses
    # Class that encapsulates a successful response from the LevelUp API.
    class Success < OpenStruct
      # Whether the response represents a successful API call.
      def success?
        true
      end

    end
  end
end

# For accessing Openstruct object custom attribute 'id', dynamically defining 'id' method in class otherwise it will show
# "Object#id will be deprecated; use Object#object_id" warning
class OpenStruct
  define_method(:id) {@table[:id]}
end

