# frozen_string_literal: true

module Rulers
  class Application
    private

    # Extracts the controller and it's corresponding action from a network request.
    #
    # @param env [{String => String}]
    # @return [(Symbol, String)]
    def get_controller_and_action(env)
      _, cont, action, _after = env["PATH_INFO"].split("/", 4)
      cont = Object.const_get("#{cont.capitalize}Controller")
      [cont, action]
    end
  end
end
