class Tile

  WIDTH = HEIGHT = 30 # same width and height for square, really!
  SOLID = 255 # filled with color (alpha channel) 
  attr_reader :color, :x, :y, :selected, :tint_color

  def initialize(red, green, blue)
    @color = Color.new(SOLID, red, green, blue)
    @tint_color = Color.new(SOLID, red+50, green+50, blue+50) 
    @selected = false
  end

  def draw_at(x, y)
    @x = x
    @y = y
    if @selected
      Gosu.draw_rect(x, y, WIDTH, HEIGHT, tint_color)
      Gosu.draw_rect(x+3, y+3, WIDTH-6, HEIGHT-6, color)
    else
      Gosu.draw_rect(x, y, WIDTH, HEIGHT, Color.argb(0xff_808080))
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