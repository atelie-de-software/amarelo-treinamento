require 'dispel'

x = 0
y = 0
output = ''
array = Array.new(10, 0)

# draw app and redraw after each keystroke
Dispel::Screen.open do |screen|
  map = Dispel::StyleMap.new(3) # number of lines

  Dispel::Keyboard.output timeout: 0.5 do |key|
    screen.draw output
    next unless key

    exit(true) if key == :"Ctrl+c"

    x += 1 if key == :right
    x -= 1 if key == :left
    y += 1 if key == :up
    y -= 1 if key == :down

    output = "The time is #{Time.now}\n"
    next if key == :timeout

    output += "You pressed #{key}\n"
    output += "x: #{x} y: #{y}\n"

    screen.draw "m", map, [x,y] # text, styles, cursor position
  end
end
