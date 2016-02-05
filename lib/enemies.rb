class Enemies
  attr_reader :all_the_baddies, :ground

  MinimumBaddies = 3
  SecondBetweenBaddieSpawns = 2

  def initialize(ground)
    @all_the_baddies = []
    @ground = ground
    @last_time_enemy_was_created = Time.now
  end

  def update
    all_the_baddies << create_enemy if need_more_baddies?

    all_the_baddies.each do |baddie|
      baddie.go_left
      baddie.jump
      baddie.update
    end

    all_the_baddies.delete_if { |baddie| baddie.off_screen? }
  end

  def draw
    all_the_baddies.each { |baddie| baddie.draw }
  end

  private

  def need_more_baddies?
    all_the_baddies.size < MinimumBaddies and it_has_been_a_while
  end

  def it_has_been_a_while
    Time.now - @last_time_enemy_was_created > SecondBetweenBaddieSpawns
  end

  def create_enemy
    @last_time_enemy_was_created = Time.now
    Enemy.new(Consts::WindowWidth - Player::Size, 0, ground) 
  end
end
