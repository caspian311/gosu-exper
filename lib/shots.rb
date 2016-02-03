require 'byebug'

class Shots
  attr_reader :player
  attr_reader :shots

  ShotSpeed = 5
  DistanceBeforeShootingAgain = 100

  def initialize(player)
    @shots = []
    @player = player
  end

  def shoot
    return if shooting?

    shots << Shot.new(player.current_position[0], player.current_position[1])
  end

  def update
    shots.each do |shot|
      shot.x += ShotSpeed
    end
    shots.delete_if { |shot| shot.x > Consts::WindowWidth }
  end

  def draw
    shots.each do |shot|
      shot.draw
    end
  end

  private 

  def shooting?
    return false if shots.empty?
    shots.last.x < shots.last.initial_x + DistanceBeforeShootingAgain
  end
end

class Shot
  attr_accessor :x
  attr_reader :y, :initial_x

  ShotLength = 30
  ShotHeight = 5

  def initialize(x, y)
    @x = x
    @initial_x = x
    @y = y
  end

  def draw
    Gosu::draw_quad x, y, Gosu::Color::RED,
      x + ShotLength, y, Gosu::Color::BLUE,
      x + ShotLength, y + ShotHeight, Gosu::Color::GREEN,
      x, y + ShotHeight, Gosu::Color::YELLOW,
      ZOrder::Shot
  end
end

