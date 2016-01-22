require 'gosu'
require_relative './player.rb'
require_relative './background.rb'
require_relative './consts.rb'

class GameWindow < Gosu::Window
  def initialize
    super Consts::WindowWidth, Consts::WindowHeight

    self.caption = "Bouncing Ball"

    @player = Player.new
    @player.go_to Consts::WindowWidth / 2, Consts::WindowHeight / 2 - Player::Size
    @background = Background.new
  end

  def update
    @player.go_left if left_pressed?
    @player.go_right if right_pressed?
    @player.jump if jump_pressed?

    @player.update
  end

  def draw
    @background.draw
    @player.draw
  end

  private

  def jump_pressed?
    Gosu::button_down? Gosu::KbSpace
  end

  def right_pressed?
    Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight
  end

  def left_pressed?
    Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft
  end

  def button_down(id)
    close if escape_pressed? id
  end

  def escape_pressed?(id)
    id == Gosu::KbEscape
  end
end

