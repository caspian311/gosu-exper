require 'gosu'
require_relative './player.rb'
require_relative './background.rb'
require_relative './consts.rb'

class GameWindow < Gosu::Window
  def initialize
    super Consts::WindowWidth, Consts::WindowHeight

    self.caption = "Bouncing Ball"

    @player = Player.new
    @player.go_to Consts::WindowWidth / 2, Consts::WindowHeight / 2 - Player::Height
    @background = Background.new
  end

  def update
    @player.go_left if turn_left
    @player.go_right if turn_right

    @player.update
  end

  def draw
    @background.draw
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

