require 'gosu'
require_relative './z_order.rb'
require_relative './consts.rb'

class Background
  def initialize(color = Gosu::Color::WHITE)
    @color = color
  end

  def draw
    Gosu::draw_rect 0, Consts::WindowHeight / 2, 
        Consts::WindowWidth, Consts::WindowHeight / 2, 
        @color, ZOrder::Background
  end
end
