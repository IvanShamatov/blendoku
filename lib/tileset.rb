require './lib/tile'

class Tileset

  attr_reader :from, :to, :steps, :tiles, :original

  def initialize(from, to, steps)
    @from = from
    @to = to
    @steps = steps
    @original = get_tiles
    @tiles = @original.shuffle
  end

  def get_tiles
    red_step = (to.red - from.red)/(steps-1).to_f
    green_step = (to.green - from.green)/(steps-1).to_f
    blue_step = (to.blue - from.blue)/(steps-1).to_f
    (0...steps).map do |step|
      red = (from.red+red_step*step).ceil
      green = (from.green+green_step*step).ceil
      blue = (from.blue+blue_step*step).ceil
      Tile.new(red, green, blue)
    end
  end

  def draw_at(y)
    # debug purposes rendering original 
    # original.each_with_index do |tile, i|
    #   tile_x = i*Tile::WIDTH + (i+1)*27
    #   tile_y = y
    #   tile.draw_at(tile_x, tile_y)
    # end
    
    tiles.each_with_index do |tile, i|
      tile_x = i*Tile::WIDTH + (i+1)*27
      tile_y = y + Tile::HEIGHT + 27
      tile.draw_at(tile_x, tile_y)
    end
  end

  def switch(first, last)
    first = tiles.index(first)
    last = tiles.index(last)
    tiles[first], tiles[last] = tiles[last], tiles[first]
  end

  def tile_by(x, y)
    @tiles.select { |tile| tile.clicked?(x, y) }.first
  end

  def correct?
    (@tiles == @original) || (@tiles == @original.reverse)
  end

end