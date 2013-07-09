require 'ruby-processing'
class FirstSketch < Processing::App

  def setup
    background(0, 0, 0)
  end

  def draw
 	 if @size.nil? || @size == 150
   	 @size = 1
  	else
  	  @size = @size + 1
  	end

  	fill(rand(225), rand(110+ @size), rand(154))
  	rect(rand(100), rand(100), @size, @size)
  	
  end

end

FirstSketch.new(:width => 500, :height => 500,
  :title => "FirstSketch", :full_screen => false)
