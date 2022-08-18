# frozen_string_literal: true

# Main Class Game
class Game
  attr_reader :frames, :score

  def initialize(test=nil)
    @frames = test || Array.new(10) { init_frames_rolls() } # [[roll1, roll2, score_total],[roll1, roll2, score_total]..]
    @score = 0
    p @frames
  end

  def init_frames_rolls()
    roll_two=0
    roll_one = rand(1..10)
    roll_two = 'strike' if roll_one == 10
    #return [roll_one, roll_two, 0] if roll_two == 'strike'
    roll_two = rand(1..(10 - roll_one)) unless roll_two.is_a?(String)
    roll_two = 'spare' if roll_two.is_a?(Integer) && roll_one + roll_two == 10
    #return [roll_one, roll_two, 0] if roll_two == 'spare'

    [roll_one, roll_two, 0]
  end

  def calculate_score
    (0..9).each do |frame|
      current_frame = @frames[frame]
      last_frame(frame) && break if frame == 9 # cuando se llama el frame 10

      (0..2).each do |index|
        @score += 10 + @frames[frame + 1][0] + spare_strike_num?(frame) if current_frame[index] == 'strike'
        @score += (10 - current_frame[index - 1]) + @frames[frame + 1][0] if current_frame[index] == 'spare'
        @score += current_frame[index] if current_frame[index].class != String
        current_frame[index] = @score if index == 2
      end
    end

    # [[4, 'spare', 10]] [[1,'spare',0]]

    p @frames
    @score
  end

  def last_frame(frame)
    return roll_twice(frame) if @frames[frame][0] == 10 # cuando es un strike
    return roll_once(frame) if @frames[frame][1] == 'spare'

    @frames[frame][2] = @score += (@frames[frame][0] + @frames[frame][1])
  end

  def roll_once(frame)
    @score += @frames[frame][0]
    @score += (10 - @frames[frame][0])
    @frames[frame][2] = rand(1..10)
    @frames[frame][3] = @score += @frames[frame][2]
  end

  # [8,'spare',4,102]

  def roll_twice(frame)
    @score += @frames[frame][0]
    @score += @frames[frame][1] = rand(1..10)
    @score += @frames[frame][2] = rand(1..10)
    @frames[frame].push(@score)
  end

  # [10,4,8, 123]

  def spare_strike_num?(frame)
    frame_plus_one = @frames[frame + 1]
    return 0 if frame_plus_one[1] == 'strike'
    return 10 - frame_plus_one[0] if frame_plus_one[1] == 'spare'

    frame_plus_one[1]
  end
end

new_game = Game.new
#new_game.calculate_score
