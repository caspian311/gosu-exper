require 'gosu'

class Background
  def initialize(primary_color, secondary_color = Gosu::Color::BLACK)
    @primary_color = primary_color
    @secondary_color = secondary_color
  end

  def draw
    Gosu::draw_quad 0, 0, @primary_color,
          Consts::WindowWidth, 0, @primary_color,
          Consts::WindowWidth, Consts::WindowHeight, @secondary_color,
          0, Consts::WindowHeight, @secondary_color,
          ZOrder::Background
  end
end
