require_relative './player'

class Enemy < Player
  OffscreenBuffer = 5

  def draw_player_image
    Media::Player.draw @x, @y, ZOrder::Player, 1, 1, Gosu::Color::RED
  end

  def off_screen?
    x <= -Size
  end

  def x_min
    -Size - OffscreenBuffer
  end

end
