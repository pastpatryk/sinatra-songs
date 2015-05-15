require 'spec_helper'

describe Sinatra::Songs do

  subject { Module.new { extend Sinatra::Songs } }

  let(:endpoints) { subject.instance_variable_get(:@endpoints) }
  let(:type) { :get }
  let(:route) { '/test' }
  let(:block) { Proc.new{} }
  let(:hash) { {type: type, route: route, block: block} }

  describe '#extended' do
    it 'initializes empty endpoints array' do
      expect(endpoints).to eq []
    end
  end

  describe '.registered' do
    it 'has registered method' do
      expect(subject).to respond_to(:registered)
    end

    it 'defines endpoints on a passed app' do
      subject.instance_variable_set(:@endpoints, [hash])
      app = double
      expect(app).to receive(type).with(route, &block)
      subject.registered(app)
    end
  end

  describe '.add_endpoint' do
    it 'adds hash with given params to endpoints array' do
      subject.add_endpoint(type, route, &block)
      expect(endpoints).to include()
    end
  end

  describe 'generating methods for default types' do
    it 'responds to all methods' do
      Sinatra::Songs::DEFAULT_TYPES.each do |type|
        expect(subject).to respond_to type
      end
    end
  end

end
