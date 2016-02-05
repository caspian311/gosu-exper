require 'gosu'

class Player
  attr_reader :x

  MaxSpeed = 4
  Size = 25
  ShadowOffset = 20
  MaxLeft = 0
  JumpForce = 7
  MaxRight = Consts::WindowWidth - Size

  def initialize(initial_x, initial_y, ground)
    @x = initial_x
    @y = initial_y
    @ground = ground

    @x_velocity = @y_velocity = 0.0
  end

  def current_position
    return [@x + Size / 2, @y + Size / 2]
  end

  def go_left
    @x_velocity -= 0.1 if @x_velocity > -MaxSpeed
  end

  def go_right
    @x_velocity += 0.1 if @x_velocity > -MaxSpeed
  end

  def jump
    if at_ground_level?
      @y_velocity = -JumpForce 
      play_jumping_sound
    end
  end

  def update
    update_x
    update_y
  end

  def draw
    draw_player_image
    Media::PlayerShadow.draw @x, y_min + ShadowOffset, ZOrder::Shadow
  end

  private

  def play_jumping_sound
    Media::Boink.play
  end

  def draw_player_image
    Media::Player.draw @x, @y, ZOrder::Player
  end

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
    attempted_x >= x_min and attempted_x <= MaxRight and not_in_a_wall(attempted_x)
  end

  def x_min
    MaxLeft
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
