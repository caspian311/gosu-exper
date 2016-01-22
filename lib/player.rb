require_relative './z_order.rb'

class Player
  attr_reader :score

  TurningSpeed = 4.5
  Deceleration = 0.95
  AccelerationRate = 0.5
  ProximityToStar = 35

  def initialize
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= TurningSpeed
  end

  def turn_right
    @angle += TurningSpeed
  end

  def accelerate
    @vel_x += Gosu::offset_x(@angle, AccelerationRate)
    @vel_y += Gosu::offset_y(@angle, AccelerationRate)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= GameWindow::Width
    @y %= GameWindow::Height

    @vel_x *= Deceleration
    @vel_y *= Deceleration
  end

  def draw
    Media::PlayerImage.draw_rot(@x, @y, ZOrder::Player, @angle)
  end

  def collect_stars(stars)
    if collide_with_stars stars
      @score += 1
      Media::StarCapturedSound.play
      true
    else
      false
    end
  end

  private

  def collide_with_stars stars
    stars.reject! do |star|
      Gosu::distance(@x, @y, star.x, star.y) < ProximityToStar
    end
  end
end
