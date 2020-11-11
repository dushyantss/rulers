# typed: strict
# frozen_string_literal: true
require "rulers/version"
require "rulers/routing"

module Rulers
  class Application
    extend T::Sig

    sig { params(env: T::Hash[String, String]).returns(T::Array[T.any(Integer, T::Hash[String, String], T::Array[String])]) }
    def call(env)
      klass, action = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(action)
      [200, { 'Content-Type' => 'text/html' }, [text]]
    end
  end

  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
end
