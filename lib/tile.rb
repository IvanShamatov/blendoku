class Tile

  WIDTH = HEIGHT = 50 # same width and height for square, really!
  SOLID = 255 # filled with color (alpha channel) 
  attr_reader :color, :x, :y, :selected

  def initialize(red, green, blue)
    @color = Gosu::Color.new(SOLID, red, green, blue)
    @selected = false
  end

  def draw_at(x, y)
    @x = x
    @y = y
    if @selected
      Gosu.draw_rect(x, y, WIDTH, HEIGHT, Gosu::Color.argb(0xff_cccccc))
      Gosu.draw_rect(x+5, y+5, WIDTH-10, HEIGHT-10, color)
    else
      Gosu.draw_rect(x, y, WIDTH, HEIGHT, Gosu::Color.argb(0xff_808080))
      Gosu.draw_rect(x+2, y+2, WIDTH-4, HEIGHT-4, color)
    end
  end

  def select!
    @selected = true
  end

  def unselect!
    @selected = false
  end

  def clicked?(mouse_x, mouse_y)
    (x...x+WIDTH).cover?(mouse_x.ceil) && (y...y+HEIGHT).cover?(mouse_y.ceil)
  end

end