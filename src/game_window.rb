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
    @star = Star.new(@star_image) # initializes the star in game window)
    @score = 0
    @text_object = Gosu::Font.new(self, 'Space Mono', 32)
    @game_start = Gosu::Sample.new("media/sounds/game_start.wav")
    @game_start.play
    @beep = Gosu::Sample.new("media/sounds/beep.wav")
    @game_over = Gosu::Sample.new("media/sounds/game_over.wav")
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

    if @snake.collected_star?(@star)
      @beep.play
      @star = Star.new(@star_image) # generates a new star

      if @star.x != @snake.x..(@snake.x+10)
          @score += 10               # add 10 points to the score
      	  @snake.length += 10        # increase the snake's length

      	  # 11 because we subtract one at the end of the method anyway
      	  @snake.ticker += 11
      else
          @snake.collected_star?(@star)
      end

      if @score % 100 == 0 # increase speed each time score increases by 100
      		@snake.speed += 1.5
      end

    end

    if @snake.hit_self?
      if @new_game == nil
        @game_over.play
      end
      @new_game = Gosu::Font.new(self, 'Space Mono', 32)
    end

    if @snake.outside_bounds?
      if @new_game == nil
        @game_over.play
      end
      @new_game = Gosu::Font.new(self, 'Space Mono', 32)
    end

    # start new game if return is pressed
    if @new_game && (button_down? Gosu::KbReturn)
			@new_game = nil
      @score = 0
	    @snake = Snake.new(self)
	    @star = Star.new(@star_image)
		end

    @snake.ticker -= 1 if @snake.ticker > 0
  end

  def draw
    # if snake dies do this or keep drawing the game in the window
    if @new_game
      @background_image.draw(0, 0, 0)
      @new_game.draw("YOU DIED!! YOUR SCORE WAS #{@score}!", 180, 180, 100)
			@new_game.draw("PRESS RETURN TO PLAY AGAIN", 192, 230, 100)
			@new_game.draw("OR ESCAPE TO EXIT", 235, 280, 100)
    else
    @background_image.draw(0, 0, 0)
    @snake.update_position
    @star.draw
    @snake.draw
    @text_object.draw("SCORE: #{@score}",5,5,0)
    end
  end

end
