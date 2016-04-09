class Gosu::Color
  def self.random
    new(255, rand(0...255), rand(0...255), rand(0...255))
  end
end