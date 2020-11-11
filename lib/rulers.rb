# frozen_string_literal: true
require "rulers/version"
require "rulers/routing"

module Rulers
  # The main class for our framework.
  # Need to extend this class in the application which will be setup in config.ru for rack.
  class Application
    # Called by rack on every network request.
    #
    # @param env [{String => String}] the single environment object passed to
    #   to us by rack. It contains all the information regarding an network call
    #   like url, headers, etc.
    # @return [(Integer, {String => String}, <String>)] the response we
    #   will be sending for the network call. It is an array with three entries.
    #   1. The response code, usually 200 for success.
    #   2. A hash containing all of the headers to be sent back to the client.
    #   3. The response to be sent in an array form.
    def call(env)
      klass, action = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(action)
      [200, { 'Content-Type' => 'text/html' }, [text]]
    end
  end

  # The main controller class, to be extended by every other controller.
  class Controller
    # @return [{String => String}]
    attr_reader :env

    # @param env [{String => String}]
    def initialize(env)
      @env = env
    end
  end
end
