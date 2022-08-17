# frozen_string_literal: true

class Game
  def initialize
    @frames = Array.new(10){initialize_frames} # [[roll1, roll2, score_total],[roll1, roll2, score_total]..]
  end

  def frames
    @frames
  end

  def initialize_frames()
    [roll(),state(),0]
  end

  def roll(roll,roll2=0)
    pins=10
  end

  def state (roll,roll2=0)
    pins=10
    pins-= (roll+roll2)
    :strike if roll2==0 && pins==0
    :spare if pins==0
    :normal
  end

  def spare()
  end

  def strike()
    roll(next_frame)
  end
end

new_game = Game.new
