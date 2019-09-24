require './src/jogo'

RSpec.describe Jogo do
  context 'Tela inicial' do
    let(:jogo) { Jogo.new }
    it 'Cenário inícial' do
      tela = "      \n"\
             "    # \n"\
             "   ? #\n"\
             "      \n"\
             "m_____"
      expect(jogo.tela).to eq(tela)
    end

    context 'Movimentações do personagem' do
      it 'Movimento para direita' do
        jogo = Jogo.new
        tela = "      \n"\
               "    # \n"\
               "   ? #\n"\
               "      \n"\
               "_m____"

        jogo.direita
        tela = "      \n"\
               "    # \n"\
               "   ? #\n"\
               "      \n"\
               '_m____'
        expect(jogo.tela).to eq(tela)
      end

      context 'Quando personagem pular' do
        it 'Sem obstáculo' do
          jogo = Jogo.new
          tela =  "      \n"\
                  "m   # \n"\
                  "   ? #\n"\
                  "      \n"\
                  "______"

          jogo.sobe
          expect(jogo.tela).to eq(tela)
        end

        xit 'Desce sem obstáculo' do
          tela =  "      \n"\
                  "    # \n"\
                  "   ? #\n"\
                  "      \n"\
                  "m_____"
          jogo.sobe
          jogo.tick
          expect(jogo.tela).to eq(tela)
        end

        xit 'Pulo com obstáculo quebrável' do
          jogo = Jogo.new
          tela =  "      \n"\
                  "  o#  \n"\
                  "  ! # \n"\
                  "  m   \n"\
                  "______"

          jogo.direita
          jogo.direita
          jogo.direita
          jogo.sobe
          expect(jogo.tela).to eq(tela)
        end

        xit 'Pulo com obstáculo não quebrável' do
          jogo = Jogo.new
          tela =  "      \n"\
                  " #    \n"\
                  "? #   \n"\
                  "  m   \n"\
                  "______"

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

    context 'Personagem deve respeitar os limites da tela' do
      xit 'Limite máximo para a lateral esquerda' do
       tela = "      \n"\
              "    # \n"\
              "   ? #\n"\
              "      \n"\
              "m_____"
      jogo.esquerda
      expect(jogo.tela).to eq(tela)
      end

      xit 'Limite máximo para a lateral direita' do
       tela = "      \n"\
              "   #  \n"\
              "  ? # \n"\
              "      \n"\
              "__m___"

       jogo.direita
       jogo.direita
       jogo.direita
       jogo.direita
       expect(jogo.tela).to eq(tela)
      end

      xit 'Limite máximo para baixo' do
        tela = "      \n"\
               "    # \n"\
               "   ? #\n"\
               "      \n"\
               "m_____"
        jogo.desce
        expect(jogo.tela).to eq(tela)
      end

      xit 'Limite máximo para cima' do
        tela = "m     \n"\
               "    # \n"\
               "   ? #\n"\
               "      \n"\
               "______"
        jogo.sobe
        expect(jogo.tela).to eq(tela)
      end
    end
  end
end
