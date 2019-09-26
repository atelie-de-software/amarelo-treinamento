require './src/modo_grafico'
require './src/modo_texto'

puts "Deseja iniciar o modo grafico? s/n"
if gets[0] == 's'
  jogar_modo_grafico
else
  jogar_modo_texto
end
