module Api
  module V1
    class ApiController < ActionController::API
      rescue_from ActiveRecord::RecordNotFound, with: :item_not_found
      rescue_from ActiveRecord::ConnectionNotEstablished, with: :db_offline

      def db_offline
        render status: :service_unavailable,
               json: { message: 'db seems to be unavailable' }
      end

      def item_not_found
        render status: :not_found, json: { message: 'Book has not been found' }
      end
    end
  end
end
