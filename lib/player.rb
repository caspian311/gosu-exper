require 'gosu'
require_relative './z_order.rb'

class Player
  MaxSpeed = 3
  Height = 25

  def initialize
    @x = @y = @x_velocity = 0.0
    @image = Gosu::Image.new("media/player.bmp")
  end

  def go_to(x, y)
    @x, @y = x, y
  end

  def go_left
    @x_velocity -= 0.1 if @x_velocity > -MaxSpeed
  end

  def go_right
    @x_velocity += 0.1 if @x_velocity > -MaxSpeed
  end

  def update
    @x_velocity *= 0.96
    @x += @x_velocity
  end

  def draw
    @image.draw @x, @y, ZOrder::Player
  end
end
