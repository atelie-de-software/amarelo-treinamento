class Jogo
  def initialize(posicao_x = 0, posicao_y = 4)
    @posicao_x = posicao_x
    @posicao_y = posicao_y
  end

  def sobe
    @posicao_y -= 1
  end

  def desce
    @posicao_y += 1
  end

  def esquerda
    @posicao_x -= 1
  end

  def direita
    @posicao_x += 1
  end

  # def tiro; end

  def tela
    campo = [
      [' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', '#', ' '],
      [' ', ' ', ' ', '?', ' ', '#'],
      [' ', ' ', ' ', ' ', ' ', ' '],
      [' ', ' ', ' ', ' ', ' ', ' ']
    ]

    if (@posicao_y >= 0 && @posicao_y <= 4) && (@posicao_x >= 0 && @posicao_x <= 6)
      campo[@posicao_y][@posicao_x] = 'm'
    end

    campo.map { |linha| linha.reduce(:+) }.join("\n")
  end

  def tick; end
end
