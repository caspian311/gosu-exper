module Media
  Background = Gosu::Image.new("media/space.png", :tileable => true)
  StarAnimation = Gosu::Image::load_tiles("media/star.png", 25, 25)
  PlayerImage = Gosu::Image.new("media/starfighter.bmp")
  StarCapturedSound = Gosu::Sample.new("media/beep.wav")
end
