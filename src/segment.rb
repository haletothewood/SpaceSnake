class Segment

	attr_accessor :x, :y

	def initialize(snake, window, position)
		@window = window
		@x = position[0]
		@y = position[1]
	end


	def draw # provides the dimensions and color of the segment
	   @window.draw_quad(@x, @y,          Gosu::Color::FUCHSIA,
	                     @x, @y + 10,     Gosu::Color::FUCHSIA,
	                     @x + 10, @y,     Gosu::Color::FUCHSIA,
	                     @x + 10, @y + 10, Gosu::Color::FUCHSIA)
	end

end
