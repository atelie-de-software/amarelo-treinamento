require 'dispel'

x = 0
y = 0
output = 'M'
array = Array.new(10, 0)

def write(line,row,text)
  Curses.setpos(line,row)
  Curses.addstr(text);
end

# draw app and redraw after each keystroke
Dispel::Screen.open do |screen|
  Dispel::Keyboard.output timeout: 0.5 do |key|
    Curses.clear
    map = Dispel::StyleMap.new(5) # number of lines
    screen.draw output
    next unless key

    exit(true) if key == :"Ctrl+c"

    x += 1 if key == :right
    x -= 1 if key == :left
    y += 1 if key == :up
    y -= 1 if key == :down

    # output = "The time is #{Time.now}\n"
    next if key == :timeout

    # output += "You pressed #{key}\n"
    # output += "x: #{x} y: #{y}\n"

    screen.draw output, map, [y, x] # text, styles, cursor position

    write((y * -1), x, 'M')
  end
end
