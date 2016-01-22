require 'gosu'
require_relative './z_order.rb'

class Player
  def initialize
    @x = @y = 0.0
    @image = Gosu::Image.new("media/player.bmp")
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def go_left
    @x -= 1
  end

  def go_right
    @x += 1
  end

  def draw
    @image.draw @x, @y, ZOrder::Player
  end
end
