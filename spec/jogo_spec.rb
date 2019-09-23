require './src/jogo'
RSpec.describe Jogo do
  describe 'method #new_jogo' do
    it 'Deve instanciar o jogo' do
      jogo = Jogo.new
      tela =  "******\n"+
              "*    *\n"+
              "*    *\n"+
              "******\n"
      expect(jogo.tela).to  eq(tela)
    end
  end
end
