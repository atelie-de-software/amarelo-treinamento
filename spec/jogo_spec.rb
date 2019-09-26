require './src/jogo'

def tela(*esperada)
  expect(jogo.tela).to eq esperada.join("\n")
end

def direita(vezes = 1)
  vezes.times { jogo.direita }
end

def esquerda(vezes = 1)
  vezes.times { jogo.esquerda }
end

def desce(vezes = 1)
  vezes.times { jogo.desce }
end

def sobe(vezes = 1)
  vezes.times { jogo.sobe }
end

def tick(vezes = 1)
  vezes.times { jogo.tick }
end

RSpec.describe Jogo do
  let(:jogo) { Jogo.new }
  context 'Instanciação da tela' do
    it 'Tela Inicial' do
      tela '      ',
           '    # ',
           '   ? #',
           '      ',
           'm_____'
    end
  end

  context 'Movimentação do cenário' do
    xit 'Cenário anda para a esquerda' do
     direita 4
     tela '      ',
          ' #    ',
          '? #   ',
          '      ',
          '__m___'
    end
  end

  context 'Movimentações do personagem' do
    it 'Movimento para direita' do
      direita
      tela '      ',
           '    # ',
           '   ? #',
           '      ',
           '_m____'
    end

    it 'Movimento para a esquerda' do
      esquerda
      tela '      ',
           '    # ',
           '   ? #',
           '      ',
           'm_____'
    end

    context 'Personagem deve respeitar os limites da tela' do
      it 'Limite máximo para a lateral esquerda' do
       esquerda
       tela '      ',
            '    # ',
            '   ? #',
            '      ',
            'm_____'
      end

      it 'Limite máximo para baixo' do
        desce
        tela '      ',
             '    # ',
             '   ? #',
             '      ',
             'm_____'
      end
    end

    context 'Quando personagem pular' do
      context 'Sem obstáculo' do
        xit 'deve descer' do
          sobe
          tick
          tela '      ',
               '    # ',
               '   ? #',
               'm     ',
               '______'
          tick
          tela '      ',
               '    # ',
               'm  ? #',
               '      ',
               '______'
          tick
          tela '      ',
               'm   # ',
               '   ? #',
               '      ',
               '______'
          tick
          tela '      ',
               '    # ',
               'm  ? #',
               '      ',
               '______'
          tick
          tela '      ',
               '    # ',
               '   ? #',
               'm     ',
               '______'
          tick
          tela '      ',
               '    # ',
               '   ? #',
               '      ',
               'm_____'
        end
      end

      context 'Pulo com obstáculo quebrável surpresa' do
        xit 'deve trocar o bloco e exibir o cogumelo' do
          direita 2
          sobe
          tick
          tela '      ',
               '    # ',
               '   ? #',
               '   m  ',
               '______'
          tick
          tela '      ',
               '    # ',
               '   ! #',
               '   m  ',
               '___o__'
        end
      end

      context 'Pulo com obstáculo não quebrável' do
        xit 'deve bater no bloco e cair' do
          direita 4
          sobe
          tick
          tela '      ',
               '  #   ',
               ' ? #  ',
               '      ',
               '___m__'

          tick
          tela '      ',
               '  #   ',
               ' ? #  ',
               '   m  ',
               '______'

          tick
          tela '      ',
               '  #   ',
               ' ? #  ',
               '      ',
               '___m__'
        end
      end

      context 'tendo um cogumelo no caminho' do
        xit 'deve mudar para o Mario grande' do
          direita 1
          sobe
          tick
          tela '      ',
               '    # ',
               '   ! #',
               '   m  ',
               '___o__'
          tick
          tela '      ',
               '    # ',
               '   ! #',
               '      ',
               '___M__'
        end
      end
    end
  end
end
