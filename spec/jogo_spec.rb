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

def pula(vezes = 1)
  vezes.times { jogo.pula }
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
          pula
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
          pula
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
    it 'deve aparecer após 10 ticks' do
      direita 2
      tick 10
      tela '      ',
           '    # ',
           '   ? #',
           '      ',
           'w_m___'
    end

    it 'deve andar a direita a cada tick' do
      direita 4
      tick 10
      tela '      ',
           '    # ',
           '   ? #',
           '      ',
           'w___m_'

      tick
      tela '      ',
           '    # ',
           '   ? #',
           '      ',
           '_w__m_'
    end

    xit 'não deve exceder o limite esquerdo' do
      tick
      tela '      ',
           '    # ',
           '   ? #',
           '      ',
           'm____w'
    end

    xit 'deve voltar quando chegar no limite esquerdo' do
      tick
      tela '      ',
           '    # ',
           '   ? #',
           '      ',
           'm___w_'
    end

    context 'mario colidindo com o inimigo' do
      context 'estando especial' do
        it 'deve matar o inimigo' do
          direita 3
          pula
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
          tick 4
          tela '      ',
               '    # ',
               '   ! #',
               '      ',
               'w__M__'
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
               '___m__'
           tick
           tela '      ',
                '    # ',
                '   ! #',
                '      ',
                '___m__'
        end
      end

      context 'não especial' do
        xit 'deve morrer o Mario e dar game over' do
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
               '_x____'
          tick
          tela '@     ',
               '      ',
               '      ',
               '      ',
               '______'
        end
      end
    end
  end
end
