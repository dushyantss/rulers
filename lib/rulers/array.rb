# frozen_string_literal: true

class Array
  # @param [Integer] start
  # @return Integer
  def sum(start = 0)
    inject(start, &:+)
  end
end
