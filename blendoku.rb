require 'rubygems'
require 'bundler'
Bundler.require
require "./lib/tile.rb"
require "./lib/tileset.rb"
require "./lib/level.rb"
require "./gosu_ext/color.rb"

class Game < Gosu::Window
  PADDING = 20
  WIDTH = 800
  HEIGHT = 300

  def initialize
    super WIDTH, HEIGHT
    self.caption = "Ruby Blendoku"
    @level = 0
    init()
  end

  def init
    size = (@level < 7) ? @level+3 : 10
    @tileset = Tileset.new(Gosu::Color.random, Gosu::Color.random, size)
    @selected = nil
  end

  def needs_cursor? 
    true 
  end

  def get_tiles
    (0...10).map do |i| 
      Tile.new(i*25, i*25, i*25)
    end
  end

  def button_down(button)
    close if button == Gosu::KbEscape
    if [Gosu::MsLeft, Gosu::MsRight].include?(button)
      handle_switching
    end
    if @tileset.correct?
      @level += 1
      init()
    end
  end

  def handle_switching
    tile = @tileset.tile_by(mouse_x, mouse_y)
    if tile
      if @selected
        tile.select!
        tile.unselect!
        @tileset.switch(@selected, tile)
        @selected.unselect!
        @selected = nil   
      else
        tile.select!
        @selected = tile
      end
    end
  end

  def coordinates
    Gosu::Image.from_text "X: #{mouse_x}\nY: #{mouse_y}", 25, :width => WIDTH - 2 * PADDING
  end

  def welcome_text
    Gosu::Image.from_text("Click 2 to switch. ESC to quit\nLevel: #{@level}", 25, :width => WIDTH - 2 * PADDING)
  end

  def draw
    welcome_text.draw(27, 50, 100)
    @tileset.draw_at(100)
  end
end

window = Game.new
window.show