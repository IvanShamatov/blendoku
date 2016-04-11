module DrawHelpers

  def draw_rounded_rect(x, y, width, height, color, radius)
    # draw 4 cirles x+radius, y+radius
    Gosu.draw_rot(x+radius, y+radius, 0, -90, 0.5, 0.5, 3.0, 3.0, 0xff99dd33)
     # img.draw(, , 1) # 0,0
    # img.draw(x+height-radius, y+radius, 0) # 1,0
    # img.draw(x+radius, y+width-radius, 0) # 0,1
    # img.draw(x+height-radius, y+width-radius, 0) # 1,1

    # draw rect between
    # Gosu.draw_rect(x+radius, y, width-(radius*2), height, color)
  end


end