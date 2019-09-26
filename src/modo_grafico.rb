require './src/jogo'
require 'ruby2d'

SIZE_IMAGE = 25

set width: 150, height: 125
set background: 'black'
set fullscreen: true

def jogar_modo_grafico
  jogo = Jogo.new

  on :key_down do |event|
    case event.key
    when 'left'
      jogo.esquerda
    when 'right'
      jogo.direita
    when 'up'
      jogo.pula
    when 'down'
      jogo.desce
    end
  end

  update do
    clear
    sleep(0.3)

    jogo.tick
    jogo.tela.split("\n").each.with_index { |line, index_line|
      line.each_char.with_index { |c, index|
        plotar_imagem(c, index * SIZE_IMAGE, index_line * SIZE_IMAGE)
      }
    }
  end
  show
end

def plotar_imagem c, position_x, position_y
  Image.new('images/mario_direita_1.png', x: position_x, y: position_y) if c == "m"
  Image.new('images/mario_esquerda_2.png', x: position_x, y: position_y) if c == "M"
  Image.new('images/bloco_surpresa_fechado.png', x: position_x, y: position_y) if c == "?"
  Image.new('images/bloco_comum.png', x: position_x, y: position_y) if c == "#"
  Image.new('images/bloco_surpresa_aberto.png', x: position_x, y: position_y) if c == "!"
  Image.new('images/estrela.png', x: position_x, y: position_y) if c == "o"
  Image.new('images/inimigo_1_vivo.png', x: position_x, y: position_y) if c == "w"
end
