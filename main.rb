require './src/modo_grafico'
require './src/modo_texto'

p "Deseja iniciar o modo grafico? s/n"
resposta = gets[0]

if resposta == 's'
  jogar_modo_grafico
else
  jogar_modo_texto
end
