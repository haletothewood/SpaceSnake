require_relative 'snake'
require_relative 'segment'
require_relative 'star'

require 'gosu'

class GameWindow < Gosu::Window

  # what will our game of snake always have?
  def initialize
    super 640, 480
    self.caption = "Space Snake"
    @snake = Snake.new(self)
    @background_image = Gosu::Image.new("media/space_background.png")
    @star_image = Gosu::Image.new("media/star_image.png")
    @star = Star.new(@star_image) # initializes the apple in game window)
  end

  def update
    if (button_down? Gosu::KbLeft) && (@snake.direction != "right")
  		@snake.direction = "left"
  	end

  	if (button_down? Gosu::KbRight) && @snake.direction != "left"
  		@snake.direction = "right"
  	end

  	if (button_down? Gosu::KbUp) && @snake.direction != "down"
  		@snake.direction = "up"
  	end

  	if (button_down? Gosu::KbDown) && @snake.direction != "up"
  		@snake.direction = "down"
  	end

    if button_down? Gosu::KbEscape
      self.close
    end

    if @snake.outside_bounds?
      @new_game = Gosu::Font.new(self, 'Space Mono', 32)
    end

    # start new game if return is pressed
    if @new_game && (button_down? Gosu::KbReturn)
			@new_game = nil
      @score = 0
	    @snake = Snake.new(self)
	    @apple = Apple.new(self)
		end

    if button_down? Gosu::KbEscape
      self.close
    end

  end

  def draw
    # if snake dies do this or keep drawing the game in the window
    if @new_game
      @background_image.draw(0, 0, 0)
      @new_game.draw("You Died!", 5, 200, 100)
			@new_game.draw("Press Return to Try Again", 5, 250, 100)
			@new_game.draw("Or Escape to Close", 5, 300, 100)
    else
    @background_image.draw(0, 0, 0)
    @snake.update_position
    @star.draw
    @snake.draw
    end
  end

end
