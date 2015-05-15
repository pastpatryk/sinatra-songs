require 'sinatra/songs/version'

module Sinatra
  module Songs

    def self.extended(base)
      base.instance_variable_set :@endpoints, []
    end

    def registered(app)
      @endpoints.each do |e|
        app.send(e[:type], e[:route], &e[:block])
      end
    end

    public :registered

    [:get, :post, :put, :delete].each do |type|
      define_method(type) do |route, &action|
        add_endpoint(type, route, &action)
      end
    end

    def add_endpoint(type, route, &action)
      @endpoints << {type: type, route: route, action: action}
    end

  end
end
