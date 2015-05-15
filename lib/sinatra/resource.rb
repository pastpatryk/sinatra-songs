module Sinatra
  module Restful
    module Resource

      def self.extended
        base.instance_variable_set :@endpoints, []
      end

      def registered(app)
        @endpoints.each do |e|
          app.send(e[:type], e[:route], &e[:block])
        end
      end

      def get(route, &action)
        @endpoints << {type: :get, route: route, action: action}
  		end

    end
  end
end
