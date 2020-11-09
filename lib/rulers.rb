# frozen_string_literal: true
require "rulers/version"

module Rulers
  class Application
    def call(_env)
      [200, { 'Content-Type' => 'text/html' }, ["Hello, world!"]]
    end
  end
end
