require 'minitest/autorun'
require './bowling_game'
class BowlingTest < Minitest::Test
  def setup
    @frames=[[4, 1, 0], [1, 3, 0], [1, 4, 0], [9, "spare", 0], [1, 1, 0], [5, 1, 0], [9, "spare", 0], [7, 2, 0], [3, 1, 0], [4, 4, 0]]
    @game=Game.new(@frames)
  end

  def test_normal_game
    score_game_current=71
    assert_equal score_game_current, @game.calculate_score
  end

  def test_perfect_game
    perfect_score=300
    
    #frames=[[10, "strike", 0], [10, "strike", 0], [10, "strike", 0], [10, "strike", 0], [10, "strike", 0], [10, "strike", 0], [10, "strike", 0], [10, "strike", 0], [10, "strike", 0], [10, "strike", 0]]
    #game=Game.new(frames)

    #assert_equal perfect_score, game.calculate_score
  end
end