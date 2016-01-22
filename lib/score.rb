require 'gosu'

class Score
  def initialize(player)
    @player = player
    @font = Gosu::Font.new(20)
  end

  def draw
    @font.draw("Score: #{@player.score}", 
        10, 10, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
  end
end
