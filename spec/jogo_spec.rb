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
        it 'deve descer' do
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
        it 'deve trocar o bloco e exibir a surpresa e alterar o Romario' do
          direita 3
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
               '   m #',
               '      ',
               '______'
          tick
          tela '      ',
               '   m# ',
               '   ! #',
               '      ',
               '___o__'
          tick
          tela '      ',
               '    # ',
               '   m #',
               '      ',
               '___o__'
          tick
          tela '      ',
               '    # ',
               '   ! #',
               '   m  ',
               '______'
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

  context 'Inimigo' do
    xit 'deve aparecer após 10 ticks' do
      direita 2
      tick 10
      tela '      ',
      '    # ',
      '   ? #',
      '      ',
      'w_m___'
    end

    xit 'deve andar a direita a cada tick' do
      direita 4
      tick 10
      tela '      ',
           '    # ',
           '   ? #',
           '      ',
           'w__m__'
      tick
      tela '      ',
           '    # ',
           '   ? #',
           '      ',
           '_w_m__'
    end

    context 'mario colidindo com o inimigo' do
      context 'estando especial' do
        xit 'deve matar o inimigo' do
          direita 4
          tick 10
          sobe
          tick
          tela '      ',
               '    # ',
               '   ! #',
               '   m  ',
               'w__o__'
          tick
          tela '      ',
               '    # ',
               '   ! #',
               '      ',
               '_w_M__'
          tick
          tela '      ',
               '    # ',
               '   ! #',
               '      ',
               '__wM__'
          tick
          tela '      ',
               '    # ',
               '   ! #',
               '      ',
               '___M__'
        end
      end

      context 'estando pequeno' do
        xit 'deve morrer o Mario e ficar o inimigo' do
          direita 1
          tick 10
          tela '      ',
               '    # ',
               '   ? #',
               '      ',
               'wm____'
          tick
          tela '      ',
               '    # ',
               '   ? #',
               '      ',
               '_w____'
        end
      end
    end
  end
end
