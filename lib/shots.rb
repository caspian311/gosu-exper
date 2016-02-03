class Shots
  attr_reader :player
  attr_reader :shots

  ShotLength = 10
  ShotHeight = 10

  def initialize(player)
    @shots = []
    @player = player
  end

  def shoot
    shots << player.current_position
  end

  def update
    shots.each do |shot|
      shot.x += 1
    end
  end

  def draw
    shots.each do |shot|
      Gosu::draw_quad shot.x, shot.y, Gosu::Color::RED,
        shot.x + ShotLength, shot.y, Gosu::Color::BLUE,
        shot.x + ShotLength, shot.y + ShotHeight, Gosu::Color::GREEN,
        shot.x, shot.y + ShotHeight, Gosu::Color::YELLOW,
        ZOrder::Shots
    end
  end
end

