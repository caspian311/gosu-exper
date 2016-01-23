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
    @shadow_image = Gosu::Image.new("media/shadow.bmp")
    @is_jumping = false
  end

  def go_to(x, y)
    @x, @y = x, y + 10
    @y_min = y + 10
  end

  def go_left
    @x_velocity -= 0.1 if @x_velocity > -MaxSpeed
  end

  def go_right
    @x_velocity += 0.1 if @x_velocity > -MaxSpeed
  end

  def jump
    return if @is_jumping

    @is_jumping = true
    @y_velocity = -JumpForce
  end

  def update
    update_x
    update_y
  end

  def draw
    @image.draw @x, @y, ZOrder::Player
    @shadow_image.draw @x, @y_min + 20, ZOrder::Shadow
  end

  private

  def update_x
    @x_velocity *= 0.96
    @x += @x_velocity
    @x = MaxLeft if @x < MaxLeft
    @x = MaxRight if @x > MaxRight
  end

  def update_y
    if @is_jumping
      @y_velocity += 0.1
      @y += @y_velocity
      @is_jumping = @y <= @y_min
    end
    @y = @y_min if @y > @y_min
  end
end
