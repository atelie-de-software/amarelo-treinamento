require './src/jogo'
RSpec.describe Jogo do
  describe 'Tela inicial' do
    it 'Cenário inícial' do
      jogo = Jogo.new
      tela = "      \n"+
             "    # \n"+
             "   ! #\n"+
             "      \n"+
             "m_____\n"
      expect(jogo.tela).to  eq(tela)
    end
  end
end