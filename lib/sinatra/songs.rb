require 'sinatra/songs/version'

module Sinatra
  module Songs
    DEFAULT_TYPES = [:get, :post, :put, :delete]

    def self.extended(base)
      base.instance_variable_set :@endpoints, []
    end

    def registered(app)
      @endpoints.each do |e|
        app.send(e[:type], e[:route], &e[:block])
      end
    end

    DEFAULT_TYPES.each do |type|
      define_method(type) do |route, &block|
        add_endpoint(type, route, &block)
      end
    end

    def add_endpoint(type, route, &block)
      @endpoints << {type: type, route: route, block: block}
    end

  end
end
