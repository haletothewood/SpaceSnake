require_relative 'snake'
require_relative 'segment'
require_relative 'apple'

require 'gosu'

class GameWindow < Gosu::Window

  def initialize
    super 640, 480
    self.caption = "Space Snake"
  end

end
