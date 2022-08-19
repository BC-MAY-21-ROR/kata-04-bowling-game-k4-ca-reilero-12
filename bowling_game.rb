# frozen_string_literal: true

# Main Class Game
class Game
  attr_reader :frames, :score

  def initialize(test = nil)
    @frames = test || Array.new(10) do init_frames_rolls end
    @score = 0
    p @frames
  end

  def init_frames_rolls
    roll_one = init_roll_one
    roll_two = init_roll_two(roll_one)
    [roll_one, roll_two, 0]
  end

  def init_roll_one
    number_random = rand(1..10)
    return number_random == 10 ?  'strike' : number_random
  end

  def init_roll_two(roll_one)
    return 'strike' if roll_one == 10
    number_random= rand(1..(10 - roll_one))
    return number_random + roll_one == 10 ?  'spare' : number_random
  end

  def calculate_score
    (0...9).each do |frame|
      current_frame = @frames[frame]
      # last_frame(frame) && break if frame == 9 # cuando se llama el frame 10

      (0..2).each do |index|
        @score += 10 + @frames[frame + 1][0] + spare_strike_num?(frame) if current_frame[index] == 'strike'
        @score += (10 - current_frame[index - 1]) + @frames[frame + 1][0] if current_frame[index] == 'spare'
        @score += current_frame[index] if current_frame[index].class != String
        current_frame[index] = @score if index == 2
      end
    end
    last_frame
    # [[4, 'spare', 10]] [[1,'spare',0]]

    p @frames
    @score
  end

  def last_frame
    frame = @frames.last
    return roll_twice if frame[0] == 10 # cuando es un strike
    return roll_once if frame[1] == 'spare'

    frame[2] = @score += (frame[0] + frame[1])
  end

  def roll_once
    frame = @frames.last
    @score += frame[0]
    @score += (10 - frame[0])
    frame[2] = rand(1..10)
    frame[3] = @score += frame[2]
  end

  # [8,'spare',4,102]

  def roll_twice
    frame = @frames.last
    @score += frame[0]
    @score += frame[1] = rand(1..10)
    @score += frame[2] = rand(1..10)
    frame.push(@score)
  end

  # [10,4,8, 123]

  def spare_strike_num?(frame)
    frame_plus_one = @frames[frame + 1]
    return 0 if frame_plus_one[1] == 'strike'
    return 10 - frame_plus_one[0] if frame_plus_one[1] == 'spare'

    frame_plus_one[1]
  end
end

#new_game = Game.new
# new_game.calculate_score
