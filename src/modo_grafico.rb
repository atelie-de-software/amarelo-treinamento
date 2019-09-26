SIZE_IMAGE = 25

def jogar_modo_grafico
  require './src/jogo'
  require 'ruby2d'

  set width: 150, height: 125
  set background: 'black'
  set fullscreen: true

  jogo = Jogo.new

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
end
