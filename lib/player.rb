require 'gosu'

class Player
  MaxSpeed = 4
  Size = 25
  MaxLeft = 0
  JumpForce = 7
  MaxRight = Consts::WindowWidth - Size

  def initialize(initial_x, initial_y, ground)
    @x = initial_x
    @y = initial_y
    @ground = ground

    @image = Gosu::Image.new("media/player.bmp")
    @shadow_image = Gosu::Image.new("media/shadow.bmp")

    @x_velocity = @y_velocity = 0.0
  end

  def go_left
    @x_velocity -= 0.1 if @x_velocity > -MaxSpeed
  end

  def go_right
    @x_velocity += 0.1 if @x_velocity > -MaxSpeed
  end

  def jump
    return unless at_ground_level?

    @y_velocity = -JumpForce
  end

  def update
    update_x
    update_y
  end

  def draw
    @image.draw @x, @y, ZOrder::Player
    @shadow_image.draw @x, y_min + 20, ZOrder::Shadow
  end

  private

  def update_x
    @x_velocity *= 0.96
    attempted_x = @x
    attempted_x += @x_velocity

    @x = attempted_x if can_move_to? attempted_x
  end

  def update_y
    if at_ground_level? and @y_velocity >= 0
      @y_velocity = 0
      return
    end

    @y_velocity += 0.2

    @y += @y_velocity

    @y = y_min if @y > y_min
  end

  def can_move_to?(attempted_x)
    attempted_x >= MaxLeft and attempted_x <= MaxRight and not_in_a_wall(attempted_x)
  end

  def not_in_a_wall(attempted_x)
    @y <= @ground.level_at(attempted_x) and @y <= @ground.level_at(attempted_x + Size)
  end

  def at_ground_level?
    @y >= y_min
  end

  def y_min
    [@ground.level_at(@x + Size), @ground.level_at(@x)].min
  end
end
