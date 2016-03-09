require 'net/http'
require 'net/https'
require 'sinfiniruby/version'
require 'sinfiniruby/rest_client.rb'
require 'sinfiniruby/messages.rb'
module Sinfini

  extend SingleForwardable
   def_delegators :configuration, :api_key, :sender, :host

  def self.configure(&block)
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  class Configuration
    attr_accessor :api_key, :sender, :host
  end

end
