require 'gosu'
require_relative './z_order.rb'
require_relative './consts.rb'

class Ground
  def initialize(color)
    @color = color

    half_height = Consts::WindowHeight / 2

    @sections = [
      {x: 0, y: half_height},
      {x: 100, y: half_height + 20},
      {x: 200, y: half_height + 40},
      {x: 300, y: half_height + 60},
      {x: 400, y: half_height + 80},
    ]
  end

  def draw
    previous_section = nil
    @sections.each do |section|
      if previous_section.nil?
        previous_section = section
        next
      end

      Gosu::draw_rect previous_section[:x], previous_section[:y], 
          section[:x] - previous_section[:x], previous_section[:y],
          @color, ZOrder::Ground

      previous_section = section
    end

    Gosu::draw_rect previous_section[:x], previous_section[:y], 
        Consts::WindowWidth - previous_section[:x], previous_section[:y],
        @color, ZOrder::Ground
  end
end
