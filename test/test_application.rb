# typed: false
# frozen_string_literal: true

require_relative 'test_helper'

class TestApp < Rulers::Application
end

class RulersAppTest < Test::Unit::TestCase
  extend T::Sig
  include Rack::Test::Methods

  sig {returns(TestApp)}
  def app
    TestApp.new
  end

  sig {void}
  def test_request
    get "/"

    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
    headers = last_response.headers
    assert headers["Content-Type"] == 'text/html'
  end
end
