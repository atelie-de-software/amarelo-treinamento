require 'dispel'
require './src/jogo'
require 'ruby2d'

SIZE_IMAGE = 25

set width: 150, height: 125
set background: 'black'
set fullscreen: true

jogo = Jogo.new


p "Deseja iniciar o modo grafico? s/n"
resposta = gets[0]

if resposta == 's'
  on :key_down do |event|
    case event.key
      when 'left'
        jogo.esquerda
      when 'right'
        jogo.direita
      when 'up'
        jogo.sobe
      when 'down'
        jogo.desce
    end
  end

  update do
    clear
    sleep(0.1)

    jogo.tick
    jogo.tela.split("\n").each.with_index { |line, index_line|
      line.each_char.with_index { |c, index|
        Image.new('images/mario_direita_1.png', x: index * SIZE_IMAGE, y: index_line * SIZE_IMAGE)  if c == "m"
        Image.new('images/bloco_surpresa_fechado.png', x: index * SIZE_IMAGE, y: index_line * SIZE_IMAGE)  if c == "?"
        Image.new('images/bloco_comum.png', x: index * SIZE_IMAGE, y: index_line * SIZE_IMAGE) if c == "#"
      }
    }

  end

  show
else
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
