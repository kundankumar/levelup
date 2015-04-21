module Levelup
  module Requests
    # Represents a request to create an order details for the specified user at the specified merchant.
    class CreateOrderDetails < Base
      include Templates::MerchantAuthenticated

      def auth_type
        :merchant_v14
      end

      def response_from_hash(hash)
        Responses::Success.new(hash['order'])
      end
    end
  end
end
