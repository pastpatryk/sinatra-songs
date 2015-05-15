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

      public :registered

      def get(route, &action)
  			add_endpoint(:get, route, &action)
  		end

  		def post(route, &action)
  			add_endpoint(:post, route, &action)
  		end

  		def put(route, &action)
  			add_endpoint(:put, route, &action)
  		end

  		def delete(route, &action)
  			add_endpoint(:delete, route, &action)
  		end

      def add_endpoint(type, route, &action)
  			@endpoints << {type: type, route: route, action: action}
  		end

    end
  end
end
