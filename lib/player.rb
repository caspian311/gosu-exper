require 'gosu'
require_relative './z_order.rb'
require_relative './consts.rb'

class Player
  MaxSpeed = 4
  Size = 25
  MaxLeft = 0
  JumpForce = 5
  MaxRight = Consts::WindowWidth - Size

  def initialize
    @x = @y = @x_velocity = @y_velocity = 0.0
    @image = Gosu::Image.new("media/player.bmp")
    @jumping = false
  end

  def go_to(x, y)
    @x, @y = x, y
    @y_min = y
  end

  def go_left
    @x_velocity -= 0.1 if @x_velocity > -MaxSpeed
  end

  def go_right
    @x_velocity += 0.1 if @x_velocity > -MaxSpeed
  end

  def jump
    return if @jumping
    @jumping = true
    @y_velocity = -JumpForce
  end

  def update
    @x_velocity *= 0.96
    if @jumping
      @y_velocity += 0.1
      @y += @y_velocity
      @jumping = @y <= @y_min
    end
    @x += @x_velocity
    @x = MaxLeft if @x < MaxLeft
    @x = MaxRight if @x > MaxRight
    @y = @y_min if @y > @y_min
  end

  def draw
    @image.draw @x, @y, ZOrder::Player
  end
end
