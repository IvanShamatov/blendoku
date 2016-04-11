require "./lib/concerns/color_helpers.rb"

class Color < Gosu::Color
  extend ColorHelpers

  def self.random
    new(255, rand16, rand16, rand16)
  end

end