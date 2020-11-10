# typed: strict
# frozen_string_literal: true
require "rulers/version"

module Rulers
  class Application
    extend T::Sig

    sig { params(_env: String).returns(T::Array[T.any(Integer, T::Hash[String, String], T::Array[String])]) }
    def call(_env)
      [200, { 'Content-Type' => 'text/html' }, ["Hello, world!"]]
    end
  end
end
