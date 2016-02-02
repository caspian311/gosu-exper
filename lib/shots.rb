class Shots
  attr_reader :player

  def initialize(player)
    shots = []
    @player = player
  end

  def shoot
    shots << player.position
  end

  def update
  end

  def draw
  end
end

