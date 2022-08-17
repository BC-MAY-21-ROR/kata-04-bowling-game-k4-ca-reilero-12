require 'minitest/autorun'
require './bowling_game'
class BowlingTest < Minitest::Test
  def setup
    @game=Game.new
    @frames=[[1,2,score,],,,,,,,]
  end
  def test_roll_expect_spare
    score= @game.state(4,6)
    assert :spare,score
  end
  def test_roll_expect_strike
    score= @game.state(10)
    assert :strike,score
  end
  def test_roll_normal
    score= @game.state(10)
    assert :normal,score
  end
  def test_frames_count
    frames= 10
    assert frames,@game.frames.length
  end

  def test_spare
    score_frame_current=10
    score_frame_current+=@game.roll(5)
    assert 15,score_frame_current
  end
  def test_next_frame
    @frames<<
  end
end

----------------  
 tiro: 1        
 tiro2: 4       
 total : 5      
 ------------------------
 -------------------------
 frame : 2
 tiro: 4
 tiro2: 5
 total : 14
 --------------------------
 -------------------------
 frame : 3
 tiro: 6
 tiro2: spare
 total : 29
 --------------------------

 -------------------------
 frame : 4
 tiro: 5
 tiro2: spare
 total : 
 --------------------------

 -------------------------
 frame : 5
 tiro: strike
 tiro2: spare
 total : 5
 --------------------------

