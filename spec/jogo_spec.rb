require './src/jogo'

RSpec.describe Jogo do
  context 'Tela inicial' do
    let(:jogo) { Jogo.new }
    it 'Cenário inícial' do
      tela = '      \n'\
             '    # \n'\
             '   ? #\n'\
             '      \n'\
             'm_____'
      expect(jogo.tela).to eq(tela)
    end

    it 'Movimento para direita' do
      tela = '      \n'\
             '    # \n'\
             '   ? #\n'\
             '      \n'\
             '_m____'

      jogo.direita
      expect(jogo.tela).to eq(tela)
    end

    it 'Movimento para a esquerda' do
      tela = '      \n'\
             '    # \n'\
             '   ? #\n'\
             '      \n'\
             'm_____'
      jogo.esquerda
      expect(jogo.tela).to eq(tela)
    end

    it 'Movimentar cenário ao chegar na metade' do
      tela = '      \n'\
             '   #  \n'\
             '  ? # \n'\
             '      \n'\
             '__m___'

      jogo.direita
      jogo.direita
      jogo.direita
      expect(jogo.tela).to eq(tela)
    end

    xit 'Pulo sem obstáculo' do
      tela = '      \n'\
             'm   # \n'\
             '   ? #\n'\
             '      \n'\
             '______'

      jogo.sobe
      expect(jogo.tela).to eq(tela)
    end

    xit 'Desce sem obstáculo' do
      tela = '      \n'\
             '    # \n'\
             '   ? #\n'\
             '      \n'\
             'm_____'
      jogo.sobe
      jogo.tick
      expect(jogo.tela).to eq(tela)
    end

    xit 'Pulo com obstáculo quebrável' do
      tela = '      \n'\
             '  o#  \n'\
             '  ! # \n'\
             '  m   \n'\
             '______'

      jogo.direita
      jogo.direita
      jogo.direita
      jogo.sobe
      expect(jogo.tela).to eq(tela)
    end

    xit 'Pulo com obstáculo não quebrável' do
      tela = '      \n'\
             ' #    \n'\
             '? #   \n'\
             '  m   \n'\
             '______'

      jogo.direita
      jogo.direita
      jogo.direita
      jogo.direita
      jogo.direita
      jogo.sobe
      expect(jogo.tela).to eq(tela)
    end
  end
end
