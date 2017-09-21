class Segment

	attr_accessor :x, :y

	def initialize(window)
		@window = window
		@x = 200
		@y = 200
	end


	def draw # provides the dimensions and color of the segment
	   @window.draw_quad(@x, @y,          Gosu::Color::FUCHSIA,
	                     @x, @y + 10,     Gosu::Color::FUCHSIA,
	                     @x + 10, @y,     Gosu::Color::FUCHSIA,
	                     @x + 10, @y + 10, Gosu::Color::FUCHSIA)
	end

end
