require 'gosu'
require_relative './player.rb'
require_relative './star.rb'
require_relative './score.rb'
require_relative './z_order.rb'
require_relative './media.rb'

class GameWindow < Gosu::Window
  Width = 640
  Height = 480
  MaxNumberOfStars = 50

  def initialize
    super Width, Height

    self.caption = "Gosu Tutorial Game"

    @background_image = Media::Background

    @player = Player.new
    @player.warp(Width / 2, Height / 2)

    @star_anim = Media::StarAnimation
    @stars = Array.new

    @score = Score.new @player
  end

  def update
    @player.turn_left if turn_left
    @player.turn_right if turn_right
    @player.accelerate if forward

    @player.move
    @player.collect_stars @stars

    @stars.push(Star.new(@star_anim)) if need_more_stars?
  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background);
    @player.draw
    @stars.each { |star| star.draw }

    @score.draw
  end

  private

  def need_more_stars?
    rand(100) < 4 and @stars.size < MaxNumberOfStars
  end

  def forward
    Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpButton0 
  end

  def turn_right
    Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight
  end

  def turn_left
    Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft
  end

  def escape_pressed(id)
    id == Gosu::KbEscape
  end

  def button_down(id)
    close if escape_pressed id
  end
end

