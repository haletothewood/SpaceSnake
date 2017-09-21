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
  end

  def draw
    @background_image.draw(0, 0, 0)
    @snake.update_position
    @star.draw
    @snake.draw
  end

end
