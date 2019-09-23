require 'dispel'
require './src/jogo'
x = 0
y = 0
jogo = Jogo.new
array = Array.new(10, 0)
TICK = 0.5
OUTPUT = ''

Dispel::Screen.open do |screen|
  Dispel::Keyboard.output timeout: TICK do |key|
  Curses.clear

    next unless key

    exit(true) if key == :"Ctrl+c"

    y = jogo.jump(y) if key == :up
    y = jogo.down(y) if key == :down
    x = jogo.left(x) if key == :left
    x = jogo.right(x) if key == :right

    write((y * -1), x, 'M')
  end
end

def write(line,row,text)
  Curses.setpos(line,row)
  Curses.addstr(text);
end
