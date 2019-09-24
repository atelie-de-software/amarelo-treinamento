require 'dispel'
require './src/jogo'

jogo = Jogo.new
# draw app and redraw after each keystroke
Dispel::Screen.open do |screen|
  Dispel::Keyboard.output timeout: 0.5 do |key|
    screen.draw jogo.tela
    next unless key

    exit(true) if key == :"Ctrl+c"

    jogo.direita if key == :right
    jogo.esquerda if key == :left
    jogo.sobe if key == :up
    jogo.desce if key == :down

    screen.draw jogo.tela

  end
end
