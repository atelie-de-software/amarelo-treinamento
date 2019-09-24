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
        jogo.direita
        tela = "      \n"\
               "    # \n"\
               "   ? #\n"\
               "      \n"\
               '_m____'
        expect(jogo.tela).to eq(tela)
      end

      context 'Quando personagem pular' do
        xit 'Sem obstáculo' do
          jogo = Jogo.new
          jogo.sobe
          jogo.tick
          tela =  "      \n"\
                  "    # \n"\
                  "   ? #\n"\
                  "m     \n"\
                  "______"
          expect(jogo.tela).to eq(tela)

          jogo.tick
          tela =  "      \n"\
                  "    # \n"\
                  "m  ? #\n"\
                  "      \n"\
                  "______"
          expect(jogo.tela).to eq(tela)

          jogo.tick
          tela =  "      \n"\
                  "m   # \n"\
                  "   ? #\n"\
                  "      \n"\
                  "______"
          expect(jogo.tela).to eq(tela)

          jogo.tick
          tela =  "      \n"\
                  "m   # \n"\
                  "   ? #\n"\
                  "      \n"\
                  "______"
          expect(jogo.tela).to eq(tela)

          jogo.tick
          tela =  "      \n"\
                  "    # \n"\
                  "m  ? #\n"\
                  "      \n"\
                  "______"
          expect(jogo.tela).to eq(tela)

          jogo.tick
          tela =  "      \n"\
                  "    # \n"\
                  "   ? #\n"\
                  "m     \n"\
                  "______"
          expect(jogo.tela).to eq(tela)

          jogo.tick
          tela =  "      \n"\
                  "    # \n"\
                  "   ? #\n"\
                  "      \n"\
                  "m_____"
          expect(jogo.tela).to eq(tela)
        end

        xit 'Pulo com obstáculo quebrável' do
          jogo = Jogo.new
          jogo.direita
          jogo.direita
          jogo.sobe
          jogo.tick
          tela =  "      \n"\
                  "    # \n"\
                  "   ? #\n"\
                  "   m  \n"\
                  "______"
          expect(jogo.tela).to eq(tela)

          jogo.tick
          tela =  "      \n"\
                  "   o# \n"\
                  "   ! #\n"\
                  "   m  \n"\
                  "______"
          expect(jogo.tela).to eq(tela)

          jogo.tick
          tela =  "      \n"\
                  "   o# \n"\
                  "   ! #\n"\
                  "      \n"\
                  "___m__"
          expect(jogo.tela).to eq(tela)
        end

        xit 'Pulo com obstáculo não quebrável' do
          jogo = Jogo.new
          jogo.direita
          jogo.direita
          jogo.direita
          jogo.direita
          jogo.sobe
          jogo.tick
          tela = "      \n"\
                 "  #   \n"\
                 " ? #  \n"\
                 "      \n"\
                 "___m__"
          expect(jogo.tela).to eq(tela)

          jogo.tick
          tela = "      \n"\
                 "  #   \n"\
                 " ? #  \n"\
                 "   m  \n"\
                 "______"
          expect(jogo.tela).to eq(tela)

          jogo.tick
          tela = "      \n"\
                 "  #   \n"\
                 " ? #  \n"\
                 "      \n"\
                 "___m__"
          expect(jogo.tela).to eq(tela)
        end
      end
    end

    context 'Personagem deve respeitar os limites da tela' do
      xit 'Limite máximo para a lateral esquerda' do
       jogo.esquerda
       tela = "      \n"\
              "    # \n"\
              "   ? #\n"\
              "      \n"\
              "m_____"
      expect(jogo.tela).to eq(tela)
      end

      xit 'Cenário anda para a esquerda' do
       jogo.direita
       jogo.direita
       jogo.direita
       jogo.direita
       tela = "      \n"\
              "   #  \n"\
              "  ? # \n"\
              "      \n"\
              "__m___"
       expect(jogo.tela).to eq(tela)
      end

      xit 'Limite máximo para baixo' do
        jogo = Jogo.new
        jogo.desce
        tela = "      \n"\
               "    # \n"\
               "   ? #\n"\
               "      \n"\
               "m_____"
        expect(jogo.tela).to eq(tela)
      end

      xit 'Limite máximo para cima' do
        jogo = Jogo.new
        jogo.sobe
        tela = "m     \n"\
               "    # \n"\
               "   ? #\n"\
               "      \n"\
               "______"
        expect(jogo.tela).to eq(tela)
      end
    end
  end
end
