module Envato
  class Client
    module Stats
      def total_users
        response = get 'v1/market/total-users.json'
        response['total-users']['total_users'].to_i
      end

      def total_items
        response = get 'v1/market/total-items.json'
        response['total-items']['total_items'].to_i
      end

      def category_information_by_site(sitename)
        raise Envato::InvalidSiteName unless marketplace_names.include? sitename

        response = get "v1/market/number-of-files:#{sitename}.json"
        response['number-of-files']
      end

      private

      def marketplace_names
        %w(graphicriver themeforest activeden codecanyon videohive audiojungle photdune 3docean)
      end

      def marketplace_domains
        marketplace_names.map { |domain| "#{domain}.net" }
      end
    end
  end
end
