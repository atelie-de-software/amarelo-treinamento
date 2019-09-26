require './src/jogo'
require 'dispel'

def jogar_modo_texto
  jogo = Jogo.new

  Dispel::Screen.open do |screen|
    Dispel::Keyboard.output timeout: 0.5 do |key|
      next unless key

      exit(true) if key == :"Ctrl+c"

      jogo.direita if key == :right
      jogo.esquerda if key == :left
      jogo.sobe if key == :up
      jogo.desce if key == :down

      jogo.tick

      screen.draw jogo.tela
    end
  end
end
