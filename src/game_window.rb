require_relative 'snake'
require_relative 'segment'
require_relative 'apple'

require 'gosu'

class GameWindow < Gosu::Window

  def initialize
    super 640, 480
    self.caption = "Space Snake"
    @background_image = Gosu::Image.new("media/space_background.png")
  end

  def draw
    @background_image.draw(0, 0, 0)
  end
  
end
