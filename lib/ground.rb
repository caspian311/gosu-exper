require 'gosu'

class Ground
  def initialize(color)
    @color = color

    half_height = Consts::WindowHeight / 2

    @sections = {
      0..100 => half_height,
      100..200 => half_height + 20,
      200..300 => half_height + 40,
      300..400 => half_height + 60,
      400..500 => half_height + 80,
      500..600 => half_height - 40,
      600..700 => half_height - 80,
    }
  end

  def draw
    @sections.each do |range, height|
      Gosu::draw_rect range.begin, height, 
          range.size, Consts::WindowHeight - height,
          @color, ZOrder::Ground
    end
  end

  def level_at(x)
    @sections.detect { |range, value| range.include? x }.last
  end
end
