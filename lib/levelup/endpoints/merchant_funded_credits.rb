module Levelup
  module Endpoints
    # The endpoint holding all functions relating to managing merchant-funded credit.
    class MerchantFundedCredits < Base
      def give(give_credit_request, merchant_access_token)
        request = build_request(give_credit_request, Requests::GiveMerchantCredit)
        request.merchant_access_token ||= merchant_access_token
        request.send_to_api(:post, endpoint_path)
      end

      private

      def path
        'merchant_funded_credits'
      end
    end
  end
end
