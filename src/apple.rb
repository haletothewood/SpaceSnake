class Apple

attr_reader :x, :y

def initialize(window)
  @window = window
  @x = rand(10..630) # allows for random position of apple within borders of window
  @y = rand(50..470)
  until @x % 10 == 0 && @y % 10 == 0 do
    @x = rand(10..630)
    @y = rand(50..470)
  end
end

def draw # provides the dimensions and color of the apple
  @window.draw_quad(@x, @y,          Gosu::Color::CYAN,
                    @x, @y + 10,     Gosu::Color::CYAN,
                    @x + 10, @y,     Gosu::Color::CYAN,
                    @x + 10, @y + 10, Gosu::Color::CYAN)
  end
end
