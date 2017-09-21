require_relative 'snake'
require_relative 'segment'
require_relative 'star'

require 'gosu'

class GameWindow < Gosu::Window

  # what will our game of snake always have?
  def initialize
    super 640, 480
    self.caption = "Space Snake"
    @segment = Segment.new(self)
    @background_image = Gosu::Image.new("media/space_background.png")
    @star_image = Gosu::Image.new("media/star_image.png")
    @star = Star.new(@star_image) # initializes the apple in game window)
  end

  def draw
    @background_image.draw(0, 0, 0)
    @star.draw
    @segment.draw
  end

end
