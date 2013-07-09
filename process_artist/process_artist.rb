require 'ruby-processing'
class ProcessArtist < Processing::App

  def setup
    ellipse_mode CENTER
	rect_mode CENTER
   @size = 10
   @queue = ""
   @i = 255
   @red = 26
   @green = 111
   @blue = 111
   background(@red, @green, @blue)

  end  

  def draw
    # Do Stuff
  end

  def key_pressed
  	warn "A key was pressed! #{key.inspect}"
  	if @queue.nil?
  		@queue = ""
    end

    if !key.is_a?(String)
      return
    end

    if key == "+"
         @size += 50
         warn @size
      elsif key == "-"
         @size -= 50
         warn @size
      elsif key != "\n"
        @queue = @queue + key
      elsif key == "\n"        
        warn "Time to run the command: #{@queue}"
        run_command(@queue)
        @queue = ""
      end
  end

  def change_shape(key)
    if key == s1
    elsif rect(mouse_x, mouse_y, @size, @size)
    end
  end

  def run_command(command)
  	puts "Running Command #{command}"
  	if command.start_with?("b")
  		color = command[1..-1]
  		colors = color.split(",")
      @red = colors[0].to_i
      @green = colors[1].to_i
      @blue = colors[2].to_i
  		background(@red, @green, @blue)
    elsif command.start_with?("s")
        @shape = command
    elsif command.start_with?("c")
      background(@red, @green, @blue)
  	end
  end

  def mouse_pressed
  	warn " the mouse has been pressed"
    fill(rand(@i), rand(@i), rand(@i))
  	rect(mouse_x, mouse_y, @size, @size)
  end

  def mouse_dragged
    stroke(rand(@i), rand(@i), rand(@i))
    fill(rand(@i), rand(@i), rand(@i), rand(@i))
  	warn "MouseX: #{mouse_x}, Mouse_Y: #{mouse_y}" 
  	# oval(mouse_x, mouse_y, @size, @size)
  	warn "The coordinates are #{x} and #{y}"


    case @shape
      when "s1" then rect(mouse_x, mouse_y, @size, @size)
      when "s2" then rect(mouse_x, mouse_y, @size  * 2, @size * 2)
      when "s3" then 
        oval(mouse_x, mouse_y, @size, @size)
        rect(mouse_x, mouse_y, 5, 5)
    end
  end
 def mouse_released
  	warn "the mouse was released"
  	!mouse_dragged
  end
end
  	



ProcessArtist.new(:width => 400, :height => 400,
  :title => "ProcessArtist")
