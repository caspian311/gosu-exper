require 'gosu'
require_relative './player.rb'

class GameWindow < Gosu::Window
  Width = 640
  Height = 480

  def initialize
    super Width, Height

    self.caption = "Bouncing Ball"

    @player = Player.new
    @player.warp Width / 2, Height / 2
  end

  def update
    @player.go_left if turn_left
    @player.go_right if turn_right
  end

  def draw
    @player.draw
  end

  private

  def turn_right
    Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight
  end

  def turn_left
    Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft
  end

  def button_down(id)
    close if escape_pressed? id
  end

  def escape_pressed?(id)
    id == Gosu::KbEscape
  end
end

