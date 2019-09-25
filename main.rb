require 'dispel'
require './src/jogo'
require 'ruby2d'

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
    jogo.tela.split("\n")[0].each_char.with_index { |c, index|
      Image.new('images/mario.png', x: index * 25, y: 0)  if c == "m"
      Image.new('images/Bloco_surpresa.png', x: index * 25, y: 0)  if c == "?"
      Image.new('images/bloco_comum.png', x: index * 25, y: 0)  if c == "#"
    }

    jogo.tela.split("\n")[1].each_char.with_index { |c, index|
      Image.new('images/mario.png', x: index * 25, y: 25)  if c == "m"
      Image.new('images/Bloco_surpresa.png', x: index * 25, y: 25)  if c == "?"
      Image.new('images/bloco_comum.png', x: index * 25, y: 0)  if c == "#"

    }

    jogo.tela.split("\n")[2].each_char.with_index { |c, index|
      Image.new('images/mario.png', x: index * 25, y: 50)  if c == "m"
      Image.new('images/Bloco_surpresa.png', x: index * 25, y: 50)  if c == "?"
      Image.new('images/bloco_comum.png', x: index * 25, y: 0)  if c == "#"

    }

    jogo.tela.split("\n")[3].each_char.with_index { |c, index|
      Image.new('images/mario.png', x: index * 25, y: 75)  if c == "m"
      Image.new('images/Bloco_surpresa.png', x: index * 25, y: 75)  if c == "?"
      Image.new('images/bloco_comum.png', x: index * 25, y: 0)  if c == "#"
    }

    jogo.tela.split("\n")[4].each_char.with_index { |c, index|
      Image.new('images/mario.png', x: index * 25, y: 100)  if c == "m"
      Image.new('images/Bloco_surpresa.png', x: index * 25, y: 100)  if c == "?"
      Image.new('images/bloco_comum.png', x: index * 25, y: 0)  if c == "#"
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
